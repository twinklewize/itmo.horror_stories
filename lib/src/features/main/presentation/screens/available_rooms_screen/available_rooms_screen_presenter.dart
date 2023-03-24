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
  Timer? _updateAvailableRoomsTimer;

  @override
  void initState() {
    super.initState();
    _availableRoomsBloc = getIt.get();
    _authBLoc = getIt.get();
    _roomBloc = getIt.get();
    _getAvailableRooms();
    _startUpdateAvailableRoomsTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _stopUpdateAvailableRoomsTimer();
  }

  void openMainScreen() {
    context.pushReplacement(RoutePaths.main);
  }

  void _startUpdateAvailableRoomsTimer() {
    _updateAvailableRoomsTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _availableRoomsBloc.add(const AvailableRoomsEvent.updateAvailableRooms()),
    );
  }

  void _stopUpdateAvailableRoomsTimer() {
    _updateAvailableRoomsTimer?.cancel();
  }

  void _getAvailableRooms() {
    _availableRoomsBloc.add(const AvailableRoomsEvent.getAvailableRooms());
  }

  void joinRoom(RoomListItemModel roomListItem) {
    final userNickname = _authBLoc.state.session?.nickname;
    if (userNickname != null) {
      _roomBloc.add(RoomEvent.joinRoom(
        roomInfo: roomListItem.roomInfo,
        userNickname: userNickname,
      ));
      _roomBloc.stream.firstWhere((state) => state.maybeMap(
            succeeded: (_) {
              context.pushReplacement(RoutePaths.room);
              return true;
            },
            failed: (_) => true,
            orElse: () => false,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
