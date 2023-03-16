import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horror_stories/src/core/models/game/game.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/screens/game_screen/game_screen_presenter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/hint_cards.dart';
import '../../widgets/table_cards.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GameScreenPresenter(
      child: BlocBuilder<GameBloc, GameState>(
        bloc: getIt.get(),
        builder: (context, state) {
          return state.maybeMap(
            succeeded: (state) => RoomScreenSucceededState(game: state.game),
            orElse: () => const RoomScreenPendingState(),
          );
        },
      ),
    );
  }
}

class RoomScreenSucceededState extends StatelessWidget {
  const RoomScreenSucceededState({
    required this.game,
    super.key,
  });

  final GameModel game;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return ScreenContainer(
      child: Row(
        children: [
          TableCardsWidget(tableCardsInfo: game.tableCardsInfo),
          HintCardsWidget(hintCards: game.hintCards),
          SizedBox(
            width: mediaQuery.size.width * 0.2,
            height: mediaQuery.size.height * 0.8,
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Title3('Раунд № ${game.currentMove.roundNumber}'),
                  UIBox.base4x,
                  const Title4('Подсказки'),
                  UIBox.base4x,
                  const Title2('1 : 25'),
                  UIBox.base4x,
                  SizedBox(
                    width: mediaQuery.size.width * 0.2,
                    child: DoubleButton(
                      text1: 'Меню',
                      onPressed1: GameScreenPresenter.of(context).openMainScreen,
                      text2: 'Выйти',
                      onPressed2: GameScreenPresenter.of(context).leaveRoom,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomScreenPendingState extends StatelessWidget {
  const RoomScreenPendingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = AppTheme.of(context);
    return ScreenContainer(
      child: Row(
        children: [
          const Spacer(),
          const Title2('Загрузка'),
          UIBox.base8x,
          LoadingAnimationWidget.halfTriangleDot(
            color: theme.colors.system.text,
            size: UISize.base16x,
          ),
          const Spacer(),
          SizedBox(
            width: mediaQuery.size.width * 0.2,
            height: mediaQuery.size.height * 0.8,
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: mediaQuery.size.width * 0.2,
                    child: DoubleButton(
                      text1: 'Меню',
                      onPressed1: GameScreenPresenter.of(context).openMainScreen,
                      text2: 'Выйти',
                      onPressed2: GameScreenPresenter.of(context).leaveRoom,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
