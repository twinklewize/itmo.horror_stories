import 'package:flutter/material.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

import 'main_screen_presenter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreenPresenter(child: MainScreenContent());
  }
}

class MainScreenContent extends StatelessWidget {
  const MainScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecorativeLayout(
      children: [
        const Title1('HORROR'),
        const Title1('STORIES'),
        UIBox.base12x,
        PrimaryButton(
          onPressed: MainScreenPresenter.of(context).openAvailableRoomsScreen,
          text: 'Доступные комнаты',
        ),
        UIBox.base8x,
        PrimaryButton(
          onPressed: MainScreenPresenter.of(context).openActiveRoomsScreen,
          text: 'Ваши игры',
        ),
        UIBox.base12x,
        SecondaryButton(
          onPressed: MainScreenPresenter.of(context).signOut,
          text: 'Выйти',
        ),
      ],
    );
  }
}
