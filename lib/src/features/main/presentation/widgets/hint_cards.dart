import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:horror_stories/src/core/models/hint_card/hint_card.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

const _kCardHeight = 400.0;
const _kCardWidth = 300.0;

class HintCardsWidget extends StatelessWidget {
  const HintCardsWidget({
    required this.hintCards,
    super.key,
  });
  final List<HintCardModel> hintCards;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
        width: mediaQuery.size.width * 0.2,
        height: mediaQuery.size.height * 0.8,
        child: FittedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [...hintCards.map((hintCard) => PlayerHintCardWidget(hintCard: hintCard))],
          ),
        ));
  }
}

class PlayerHintCardWidget extends StatelessWidget {
  const PlayerHintCardWidget({
    Key? key,
    required this.hintCard,
  }) : super(key: key);

  final HintCardModel hintCard;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final width = hintCard.hintStatus == HintStatus.connected ? _kCardWidth : _kCardHeight;
    final height = hintCard.hintStatus == HintStatus.connected ? _kCardHeight : _kCardWidth;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.all(UISize.base5x),
          child: FlipCard(
            back: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colors.system.surface,
                  width: 4.0,
                ),
                color: theme.colors.system.surfaceDark,
              ),
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(UISize.base4x),
                child: BodyBold(
                  hintCard.card.description,
                  maxLines: 20,
                ),
              ),
            ),
            front: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colors.system.surface,
                  width: 4.0,
                ),
              ),
              child: Stack(
                children: [
                  _CardImage(
                    imageUrl: hintCard.card.imageUrl,
                    hintStatus: hintCard.hintStatus,
                  ),
                  Positioned(
                    width: width,
                    height: height / 2,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          stops: const [0, 1],
                          colors: [
                            theme.colors.system.dark.withOpacity(0.9),
                            theme.colors.system.dark.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: UISize.base4x,
                      right: UISize.base2x,
                      left: UISize.base2x,
                      child: Title3(
                        hintCard.card.cardName,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.imageUrl, required this.hintStatus});

  final String imageUrl;
  final HintStatus hintStatus;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Container(
      color: theme.colors.system.surface,
      width: hintStatus == HintStatus.connected ? _kCardWidth : _kCardHeight,
      height: hintStatus == HintStatus.connected ? _kCardHeight : _kCardWidth,
      child: RotatedBox(
        quarterTurns: hintStatus == HintStatus.connected ? 0 : -1,
        child: Image.network(
          imageUrl,
          height: _kCardHeight,
          width: _kCardWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
