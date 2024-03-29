import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';

class MainScreenPresenter extends StatefulWidget {
  static MainScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<MainScreenPresenterState>()!;
  }

  final Widget child;

  const MainScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreenPresenter> createState() => MainScreenPresenterState();
}

class MainScreenPresenterState extends State<MainScreenPresenter> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt.get();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openAvailableRoomsScreen() {
    context.pushReplacement(RoutePaths.availableRooms);
  }

  void openActiveRoomsScreen() {
    context.pushReplacement(RoutePaths.activeGames);
  }

  void signOut() {
    _authBloc.add(const AuthEvent.signOut());
    _authBloc.stream.firstWhere((state) {
      if (state.isType.unauthorized) {
        context.pushReplacement(RoutePaths.signIn);
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
