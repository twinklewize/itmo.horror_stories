import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';

class SignUpScreenPresenter extends StatefulWidget {
  static SignUpScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<SignUpScreenPresenterState>()!;
  }

  final Widget child;

  const SignUpScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreenPresenter> createState() => SignUpScreenPresenterState();
}

class SignUpScreenPresenterState extends State<SignUpScreenPresenter> {
  late AuthBloc _authBloc;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _authBloc = getIt.get();
  }

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final nicknameController = TextEditingController();

  void openSignInScreen() {
    context.pushReplacement(RoutePaths.signIn);
  }

  void signUp() {
    final login = loginController.text.trim();
    final password = passwordController.text.trim();
    final nickname = nicknameController.text.trim();

    if (login.length < 5 || password.length < 5 || nickname.length < 5) {
      return;
    }

    _authBloc.add(AuthEvent.signUp(login, password, nickname));
    _authBloc.stream.firstWhere((state) => !state.isType.pending).then((state) {
      if (state.session != null) context.push(RoutePaths.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
