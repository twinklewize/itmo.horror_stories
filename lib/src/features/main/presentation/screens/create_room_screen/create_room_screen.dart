import 'package:flutter/material.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

import 'create_room_screen_presenter.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateRoomScreenPresenter(
      child: CreateRoomScreenContent(),
    );
  }
}

class CreateRoomScreenContent extends StatelessWidget {
  const CreateRoomScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecorativeLayout(
      children: [
        const Title2('Новая'),
        const Title2('игра'),
        UIBox.base8x,
        TextInput(
          hintText: 'Код комнаты',
          controller: CreateRoomScreenPresenter.of(context).codeController,
        ),
        UIBox.base8x,
        TextInput(
          hintText: 'Количество игроков',
          controller: CreateRoomScreenPresenter.of(context).placesCountController,
        ),
        UIBox.base8x,
        TextInput(
          hintText: 'Длина хода (сек)',
          controller: CreateRoomScreenPresenter.of(context).moveTimeController,
        ),
        const Spacer(),
        DoubleButton(
          text1: 'Отменить',
          onPressed1: CreateRoomScreenPresenter.of(context).openActiveGamesScreen,
          text2: 'Создать',
          onPressed2: CreateRoomScreenPresenter.of(context).createRoom,
        ),
      ],
    );
  }
}
