import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/active_rooms_bloc/active_rooms_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart';

class ActiveRoomsScreenPresenter extends StatefulWidget {
  static ActiveRoomsScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<ActiveRoomsScreenPresenterState>()!;
  }

  final Widget child;

  const ActiveRoomsScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<ActiveRoomsScreenPresenter> createState() => ActiveRoomsScreenPresenterState();
}

class ActiveRoomsScreenPresenterState extends State<ActiveRoomsScreenPresenter> {
  late ActiveRoomsBloc _activeRoomsBloc;
  late GameBloc _gameBloc;
  late RoomBloc _roomBloc;
  late AuthBloc _authBloc;
  Timer? _updateActiveRoomsTimer;

  @override
  void initState() {
    super.initState();
    _activeRoomsBloc = getIt.get();
    _authBloc = getIt.get();
    _roomBloc = getIt.get();
    _gameBloc = getIt.get();
    _getActiveRooms();
    _startUpdateActiveRoomsTimer();
  }

  void _startUpdateActiveRoomsTimer() {
    _updateActiveRoomsTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _updateActiveRooms(),
    );
  }

  void _stopUpdateActiveRoomsTimer() {
    _updateActiveRoomsTimer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _stopUpdateActiveRoomsTimer();
  }

  @override
  void activate() {
    super.activate();
    _startUpdateActiveRoomsTimer();
  }

  @override
  void deactivate() {
    super.deactivate();
    _stopUpdateActiveRoomsTimer();
  }

  void openMainScreen() {
    _stopUpdateActiveRoomsTimer();
    context.push(RoutePaths.main);
  }

  void openCreateRoomScreen() {
    _stopUpdateActiveRoomsTimer();
    context.push(RoutePaths.createRoom);
  }

  void restoreGame(RoomListItemModel roomListItem) {
    final userNickname = _authBloc.state.session?.nickname;
    if (userNickname != null) {
      if (roomListItem.isGameStarted) {
        _gameBloc.add(GameEvent.restoreGame(
          roomInfo: roomListItem.roomInfo,
          userNickname: userNickname,
        ));
        _gameBloc.stream.firstWhere((state) => state.maybeMap(
              succeeded: (_) {
                _stopUpdateActiveRoomsTimer();
                context.push(RoutePaths.game);
                return true;
              },
              failed: (_) => true,
              orElse: () => false,
            ));
      } else {
        _roomBloc.add(RoomEvent.joinRoom(
          roomInfo: roomListItem.roomInfo,
          userNickname: userNickname,
        ));
        _roomBloc.stream.firstWhere((state) => state.maybeMap(
              succeeded: (_) {
                _stopUpdateActiveRoomsTimer();
                context.push(RoutePaths.room);
                return true;
              },
              failed: (_) => true,
              orElse: () => false,
            ));
      }
    }

    _updateActiveRoomsTimer?.cancel();
  }

  void _getActiveRooms() {
    _activeRoomsBloc.add(const ActiveRoomsEvent.getActiveRooms());
  }

  // every 5 seconds
  void _updateActiveRooms() {
    _activeRoomsBloc.add(const ActiveRoomsEvent.updateActiveRooms());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
