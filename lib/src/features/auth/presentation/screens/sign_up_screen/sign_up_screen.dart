import 'package:flutter/material.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

import 'sign_up_screen_presenter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignUpScreenPresenter(child: SinUpScreenContent());
  }
}

class SinUpScreenContent extends StatelessWidget {
  const SinUpScreenContent({super.key});

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
          controller: SignUpScreenPresenter.of(context).loginController,
        ),
        UIBox.base8x,
        TextInput(
          hintText: 'Пароль',
          keyboardType: TextInputType.visiblePassword,
          controller: SignUpScreenPresenter.of(context).passwordController,
        ),
        UIBox.base8x,
        TextInput(
          hintText: 'Никнейм',
          keyboardType: TextInputType.name,
          controller: SignUpScreenPresenter.of(context).nicknameController,
        ),
        UIBox.base12x,
        PrimaryButton(
          onPressed: SignUpScreenPresenter.of(context).signUp,
          text: 'Зарегистрироваться',
        ),
        UIBox.base8x,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Caption('Уже есть аккаунт? '),
            TouchableOpacity(
              onPressed: SignUpScreenPresenter.of(context).openSignInScreen,
              child: Caption('Вход', color: theme.colors.system.primary),
            )
          ],
        ),
      ],
    );
  }
}
