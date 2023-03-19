import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide TextInput;
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(5),
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number),
        UIBox.base8x,
        TextInput(
            hintText: 'Количество игроков',
            controller: CreateRoomScreenPresenter.of(context).placesCountController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(2),
              FilteringTextInputFormatter.digitsOnly,
              RangeInputFormatter(
                min: 2,
                max: 10,
              )
            ],
            keyboardType: TextInputType.number),
        UIBox.base8x,
        TextInput(
            hintText: 'Длина хода (сек)',
            controller: CreateRoomScreenPresenter.of(context).moveTimeController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(3),
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number),
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

class RangeInputFormatter extends TextInputFormatter {
  int min;
  int max;

  RangeInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int? numberValue = int.tryParse(newValue.text);

    if (numberValue == null) return const TextEditingValue(text: '');

    if (numberValue < min) {
      return newValue.copyWith(text: min.toString());
    }

    if (numberValue > max) {
      return newValue.copyWith(text: max.toString());
    }

    return newValue;
  }
}
