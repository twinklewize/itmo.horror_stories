import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:horror_stories/src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:horror_stories/src/features/auth/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:horror_stories/src/features/auth/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:horror_stories/src/features/main/presentation/screens/active_rooms_screen/active_rooms_screen.dart';
import 'package:horror_stories/src/features/main/presentation/screens/available_rooms_screen/available_rooms_screen.dart';
import 'package:horror_stories/src/features/main/presentation/screens/create_room_screen/create_room_screen.dart';
import 'package:horror_stories/src/features/main/presentation/screens/game_screen/game_screen.dart';
import 'package:horror_stories/src/features/main/presentation/screens/main_screen/main_screen.dart';
import 'package:horror_stories/src/features/main/presentation/screens/room_screen/room_screen.dart';

import '../di/di.dart';

export 'package:go_router/go_router.dart';

class RoutePaths {
  static const signUp = '/';
  static const signIn = '/signIn';

  static const main = '/main';
  static const availableRooms = '$main/availableRooms';
  static const activeGames = '$main/activeGames';
  static const createRoom = '$activeGames/createRoom';

  static const room = '/room';
  static const game = '/game';
}

class HorrorStoriesRouter {
  late GoRouter router;

  static final HorrorStoriesRouter _inst = HorrorStoriesRouter._internal();

  factory HorrorStoriesRouter(String initialRoute) {
    _inst.router = GoRouter(
      initialLocation: initialRoute,
      observers: [BotToastNavigatorObserver()],
      routes: [
        GoRoute(
          path: RoutePaths.signUp,
          pageBuilder: (context, state) => _transition(const SignUpScreen()),
        ),
        GoRoute(
          path: RoutePaths.signIn,
          pageBuilder: (context, state) => _transition(const SignInScreen()),
        ),
        GoRoute(
          path: RoutePaths.main,
          pageBuilder: (context, state) => _transition(const MainScreen()),
        ),
        GoRoute(
          path: RoutePaths.availableRooms,
          pageBuilder: (context, state) => _transition(const AvailableRoomsScreen()),
        ),
        GoRoute(
          path: RoutePaths.activeGames,
          pageBuilder: (context, state) => _transition(const ActiveRoomsScreen()),
        ),
        GoRoute(
          path: RoutePaths.createRoom,
          pageBuilder: (context, state) => _transition(const CreateRoomScreen()),
        ),
        GoRoute(
          path: RoutePaths.room,
          pageBuilder: (context, state) => _transition(const RoomScreen()),
        ),
        GoRoute(
          path: RoutePaths.game,
          pageBuilder: (context, state) => _transition(const GameScreen()),
        ),
      ],
      redirect: (context, state) {
        final loggedIn = getIt.get<AuthBloc>().state.isType.authorized;
        final currentRoute = state.subloc;
        final onSignPages = currentRoute == RoutePaths.signIn || currentRoute == RoutePaths.signUp;

        if (!loggedIn && onSignPages) {
          return null;
        } else if (loggedIn && !onSignPages) {
          return null;
        } else if (loggedIn && onSignPages) {
          return RoutePaths.main;
        } else if (!loggedIn && !onSignPages) {
          return RoutePaths.signIn;
        }
        return null;
      },
    );

    return _inst;
  }

  static Page<void> _transition(Widget child) {
    return NoTransitionPage<void>(child: child);
  }

  HorrorStoriesRouter._internal();
}
