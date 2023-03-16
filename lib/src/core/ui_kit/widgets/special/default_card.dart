part of '../widgets.dart';

const _kCardHeight = 400.0;
const _kCardWidth = 300.0;

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    super.key,
    required this.cardName,
  });
  final String cardName;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: _kCardHeight, maxWidth: _kCardWidth),
      child: AspectRatio(
        aspectRatio: _kCardWidth / _kCardHeight,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colors.system.surface,
              width: 4.0,
            ),
          ),
          child: Image.asset(
            "assets/raster/cards/${cardName.toUpperCase()}.png",
            height: _kCardHeight,
            width: _kCardWidth,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
