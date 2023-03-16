import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/active_rooms_bloc/active_rooms_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart';

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
  late AuthBloc _authBloc;
  late final Timer _updateActiveRoomsTimer;

  @override
  void initState() {
    super.initState();
    _activeRoomsBloc = getIt.get();
    _authBloc = getIt.get();
    _getActiveRooms();
    // _activeRoomsBloc.stream.firstWhere((state) => false);
    _updateActiveRoomsTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _updateActiveRooms(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _updateActiveRoomsTimer.cancel();
  }

  void openMainScreen() {
    context.push(RoutePaths.main);
  }

  void openCreateRoomScreen() {
    context.push(RoutePaths.createRoom);
  }

  void restoreGame(RoomInfoModel roomInfo) {
    final userNickname = _authBloc.state.session?.nickname;
    if (userNickname != null) {
      _gameBloc.add(GameEvent.restoreGame(
        roomInfo: roomInfo,
        userNickname: userNickname,
      ));
    }
    context.push(RoutePaths.game);
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
