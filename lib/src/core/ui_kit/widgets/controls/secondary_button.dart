part of '../widgets.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SecondaryButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return TouchableOpacity(
      onPressed: onPressed,
      child: Container(
        height: _kButtonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UISize.base4x),
          color: theme.colors.system.secondary,
        ),
        child: BodyBold(text, color: theme.colors.system.textOnColors),
      ),
    );
  }
}
