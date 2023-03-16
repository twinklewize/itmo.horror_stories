import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';
import 'sign_in_screen_presenter.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInScreenPresenter(child: SignInScreenContent());
  }
}

class SignInScreenContent extends StatelessWidget {
  const SignInScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DecorativeLayout(
      children: [
        const Title1('HORROR'),
        const Title1('STORIES'),
        UIBox.base12x,
        TextInput(
          hintText: 'Логин',
          keyboardType: TextInputType.emailAddress,
          controller: SignInScreenPresenter.of(context).loginController,
        ),
        UIBox.base8x,
        TextInput(
          hintText: 'Пароль',
          keyboardType: TextInputType.visiblePassword,
          controller: SignInScreenPresenter.of(context).passwordController,
        ),
        UIBox.base12x,
        PrimaryButton(
          onPressed: SignInScreenPresenter.of(context).signIn,
          text: 'Войти',
        ),
        UIBox.base8x,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Caption('У вас нет аккаунта? '),
            TouchableOpacity(
              onPressed: SignInScreenPresenter.of(context).openSignUpScreen,
              child: Caption('Регистрация', color: theme.colors.system.primary),
            )
          ],
        ),
      ],
    );
  }
}
