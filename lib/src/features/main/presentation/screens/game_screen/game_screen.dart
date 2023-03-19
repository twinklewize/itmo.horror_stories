import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/screens/game_screen/game_screen_presenter.dart';
import 'package:horror_stories/src/features/main/presentation/widgets/players.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/hand_cards.dart';
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
          TableCardsWidget(
            tableCardsInfo: game.tableCardsInfo,
            onPressed: GameScreenPresenter.of(context).vote,
          ),
          HintCardsWidget(
            hintCards: [...game.hintCards.where((hintCard) => hintCard.hintStatus != HintStatus.hand)],
          ),
          SizedBox(
            width: mediaQuery.size.width * 0.2,
            height: mediaQuery.size.height * 0.8,
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Title3('Раунд № ${game.currentMove.roundNumber}'),
                  UIBox.base4x,
                  Title4(_getRoundPhase(game.currentMove.phase)),
                  UIBox.base4x,
                  Title2(
                      ' ${game.currentMove.remainingTime ~/ 60} : ${(game.currentMove.remainingTime % 60).toString().padLeft(2, '0')}'),
                  UIBox.base4x,
                  SizedBox(
                    width: mediaQuery.size.width * 0.2,
                    child: DoubleButton(
                      text1: 'Меню',
                      onPressed1: GameScreenPresenter.of(context).openMainScreen,
                      text2: 'Выйти',
                      onPressed2: GameScreenPresenter.of(context).leaveRoom,
                    ),
                  ),
                  UIBox.base4x,
                  SizedBox(
                    height: UISize.base * 64,
                    width: UISize.base * 64,
                    child: PlayersWidget(
                      placesCount: game.room.roomInfo.placesCount,
                      players: game.room.players,
                    ),
                  ),
                  if (game.room.players.where((element) => element.isMaster && element.isPlayer).isEmpty == true &&
                      game.currentMove.phase == GamePhase.voting)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: UISize.base8x),
                      child: Title3(
                        'Голосов:\n${game.tableCardsInfo.votes.where((vote) => vote.playerId == game.room.players.firstWhere((element) => element.isPlayer).playerId).length} / ${game.currentMove.cardsToRemoveCount}',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  HandCardsWidget(
                    hintCards: [...game.hintCards.where((hintCard) => hintCard.hintStatus == HintStatus.hand)],
                    onPressed: GameScreenPresenter.of(context).addHint,
                    phase: game.currentMove.phase,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getRoundPhase(GamePhase phase) {
    switch (phase) {
      case GamePhase.hints:
        return 'Подсказки';
      case GamePhase.voting:
        return 'Голосование';
    }
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
          LoadingAnimationWidget.halfTriangleDot(color: theme.colors.system.text, size: UISize.base16x),
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
