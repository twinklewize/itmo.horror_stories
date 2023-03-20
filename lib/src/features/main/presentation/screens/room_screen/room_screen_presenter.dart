import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart';

class RoomScreenPresenter extends StatefulWidget {
  static RoomScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<RoomScreenPresenterState>()!;
  }

  final Widget child;

  const RoomScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<RoomScreenPresenter> createState() => RoomScreenPresenterState();
}

class RoomScreenPresenterState extends State<RoomScreenPresenter> {
  late RoomBloc _roomBloc;
  late GameBloc _gameBloc;
  Timer? _updateRoomStateTimer;

  @override
  void initState() {
    super.initState();
    _roomBloc = getIt.get();
    _gameBloc = getIt.get();
    _startUpdateRoomStateTimer();
  }

  @override
  void activate() {
    super.activate();
    _startUpdateRoomStateTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _stopUpdateRoomStateTimer();
  }

  @override
  void deactivate() {
    super.deactivate();
    _stopUpdateRoomStateTimer();
  }

  void startGame() {
    final room = _roomBloc.state.room;
    if (room != null) {
      _gameBloc.add(GameEvent.startGame(room));
      _gameBloc.stream.firstWhere(
        (state) => state.maybeMap(
          succeeded: (_) {
            _stopUpdateRoomStateTimer();
            context.push(RoutePaths.game);
            return true;
          },
          failed: (_) => true,
          orElse: () => false,
        ),
      );
    }
  }

  void leaveRoom() {
    final roomCode = _roomBloc.state.room?.roomInfo.roomCode;
    if (roomCode != null) {
      _roomBloc.add(RoomEvent.leaveRoom(roomCode));
    }
    _stopUpdateRoomStateTimer();
    context.push(RoutePaths.main);
  }

  void _stopUpdateRoomStateTimer() {
    _updateRoomStateTimer?.cancel();
  }

  void _startUpdateRoomStateTimer() {
    _stopUpdateRoomStateTimer();
    _updateRoomStateTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _updateRoomState(),
    );
  }

  Future<void> _updateRoomState() async {
    _roomBloc.add(const RoomEvent.updateRoom());

    await _roomBloc.stream.first;

    if (_roomBloc.state.room?.isGameStarted == true &&
        _roomBloc.state.room?.players.where((element) => element.isPlayer && element.isMaster).isEmpty == true) {
      _gameBloc.add(GameEvent.joinGame(_roomBloc.state.room!));
      _gameBloc.stream.firstWhere(
        (state) => state.maybeMap(
          succeeded: (_) {
            context.push(RoutePaths.game);
            _stopUpdateRoomStateTimer();
            return true;
          },
          failed: (_) => true,
          orElse: () => false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
