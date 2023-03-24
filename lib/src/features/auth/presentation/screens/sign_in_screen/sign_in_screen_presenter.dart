import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';

import '../../../../main/presentation/widgets/toast.dart';
import '../../blocs/auth_bloc/auth_bloc.dart';

class SignInScreenPresenter extends StatefulWidget {
  static SignInScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<SignInScreenPresenterState>()!;
  }

  final Widget child;

  const SignInScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreenPresenter> createState() => SignInScreenPresenterState();
}

class SignInScreenPresenterState extends State<SignInScreenPresenter> {
  late AuthBloc _authBloc;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authBloc = getIt.get();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openSignUpScreen() {
    context.pushReplacement(RoutePaths.signUp);
  }

  void signIn() {
    if (_authBloc.state.isType.pending) {
      return;
    }
    final login = loginController.text.trim();
    final password = passwordController.text.trim();

    if (login.length < 5 || password.length < 5) {
      BotToast.showWidget(
        toastBuilder: (_) => const Toast(text: 'Длина всех полей должна быть не меньше 5 символов'),
      );
      return;
    }

    _authBloc.add(AuthEvent.signIn(login, password));
    _authBloc.stream.firstWhere((state) => !state.isType.pending).then((state) {
      if (state.session != null) {
        context.pushReplacement(RoutePaths.main);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
