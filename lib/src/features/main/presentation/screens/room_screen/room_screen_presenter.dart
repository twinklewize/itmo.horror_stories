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
  late final Timer _updateRoomStateTimer;

  @override
  void initState() {
    super.initState();
    _roomBloc = getIt.get();
    _updateRoomStateTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _updateRoomState(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _updateRoomStateTimer.cancel();
  }

  void startGame() {
    final room = _roomBloc.state.room;
    if (room != null) {
      _gameBloc.add(GameEvent.startGame(room));
    }
    context.push(RoutePaths.game);
  }

  void leaveRoom() {
    final roomCode = _roomBloc.state.room?.roomInfo.roomCode;
    if (roomCode != null) {
      _roomBloc.add(RoomEvent.leaveRoom(roomCode));
    }
    context.push(RoutePaths.main);
  }

  void _updateRoomState() {
    _roomBloc.add(const RoomEvent.updateRoom());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
