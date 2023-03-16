import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/available_rooms_bloc/available_rooms_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart';

class AvailableRoomsScreenPresenter extends StatefulWidget {
  static AvailableRoomsScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<AvailableRoomsScreenPresenterState>()!;
  }

  final Widget child;

  const AvailableRoomsScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<AvailableRoomsScreenPresenter> createState() => AvailableRoomsScreenPresenterState();
}

class AvailableRoomsScreenPresenterState extends State<AvailableRoomsScreenPresenter> {
  late AvailableRoomsBloc _availableRoomsBloc;
  late RoomBloc _roomBloc;
  late AuthBloc _authBLoc;
  late final Timer _updateAvailableRoomsTimer;

  @override
  void initState() {
    super.initState();
    _availableRoomsBloc = getIt.get();
    _authBLoc = getIt.get();
    _getAvailableRooms();
    _updateAvailableRoomsTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _updateAvailableRooms(),
    );
  }

  @override
  void activate() {
    super.activate();
    _updateAvailableRoomsTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _updateAvailableRooms(),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    _updateAvailableRoomsTimer.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _updateAvailableRoomsTimer.cancel();
  }

  void openMainScreen() {
    context.push(RoutePaths.main);
  }

  void _getAvailableRooms() {
    _availableRoomsBloc.add(const AvailableRoomsEvent.getAvailableRooms());
  }

  // каждые 5 секунд
  void _updateAvailableRooms() {
    _availableRoomsBloc.add(const AvailableRoomsEvent.updateAvailableRooms());
  }

  void joinRoom(RoomInfoModel roomInfo) {
    final userNickname = _authBLoc.state.session?.nickname;
    if (userNickname != null) {
      _roomBloc.add(RoomEvent.joinRoom(
        roomInfo: roomInfo,
        userNickname: userNickname,
      ));
    }
    context.push(RoutePaths.room);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
