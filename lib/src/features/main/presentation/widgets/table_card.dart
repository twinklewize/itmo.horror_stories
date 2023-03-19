import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

const _kCardHeight = 400.0;
const _kCardWidth = 300.0;

class TableCardWidget extends StatelessWidget {
  const TableCardWidget({
    super.key,
    required this.tableCard,
    required this.onPressed,
  });
  final TableCardModel tableCard;
  final Function(Id tableCardId) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: _kCardHeight, maxWidth: _kCardWidth),
      child: AspectRatio(
        aspectRatio: _kCardWidth / _kCardHeight,
        child: Stack(
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
                  width: _kCardWidth,
                  height: _kCardHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(UISize.base4x),
                    child: BodyRegular(
                      tableCard.card.description,
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
                        imageUrl: tableCard.card.imageUrl,
                        isSelected: tableCard.isSelected,
                      ),
                      const _TextBackgroundGradient(),
                      _CardName(cardName: tableCard.card.cardName),
                      if (!tableCard.isOnTable)
                        Positioned(
                          top: UISize.base2x,
                          bottom: UISize.base2x,
                          right: UISize.base2x,
                          left: UISize.base2x,
                          child: Image.asset('assets/raster/cross.png'),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (tableCard.votesCount > 0)
              Positioned(
                  left: UISize.base,
                  top: UISize.base,
                  child: Container(
                    width: UISize.base10x,
                    height: UISize.base10x,
                    decoration: BoxDecoration(
                      boxShadow: UIShadow.button,
                      shape: BoxShape.circle,
                      color: theme.colors.system.surface,
                      border: Border.all(color: theme.colors.system.surface),
                    ),
                    child: Center(
                        child: Title3(
                      tableCard.votesCount.toString(),
                      color: theme.colors.system.background,
                    )),
                  )),
            if (tableCard.canBeVoted)
              Positioned(
                  right: UISize.base,
                  top: UISize.base,
                  child: TouchableOpacity(
                    onPressed: () => onPressed(tableCard.tableCardId),
                    child: Container(
                      width: UISize.base10x,
                      decoration: BoxDecoration(
                        boxShadow: UIShadow.button,
                        shape: BoxShape.circle,
                        color: theme.colors.system.background,
                      ),
                      child: AppIcons.add(
                        size: UISize.base10x,
                        color: theme.colors.system.primary,
                      ),
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

class _CardName extends StatelessWidget {
  const _CardName({
    required this.cardName,
  });

  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: UISize.base4x,
        right: UISize.base2x,
        left: UISize.base2x,
        child: Title3(
          cardName,
          maxLines: 4,
          textAlign: TextAlign.center,
        ));
  }
}

class _TextBackgroundGradient extends StatelessWidget {
  const _TextBackgroundGradient();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
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
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({required this.isSelected, required this.imageUrl});

  final bool isSelected;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    if (isSelected) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(
          theme.colors.system.primary,
          BlendMode.modulate,
        ),
        child: ColorFiltered(
          colorFilter: const ColorFilter.linearToSrgbGamma(),
          child: Container(
            color: theme.colors.system.surface,
            width: _kCardWidth,
            height: _kCardHeight,
            child: Image.network(
              imageUrl,
              height: _kCardHeight,
              width: _kCardWidth,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: theme.colors.system.surface,
        width: _kCardWidth,
        height: _kCardHeight,
        child: Image.network(
          imageUrl,
          height: _kCardHeight,
          width: _kCardWidth,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
