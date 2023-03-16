part of '../widgets.dart';

const _kButtonHeight = UISize.base12x;

class PrimaryButton extends StatelessWidget {
  final String text;
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final VoidCallback onPressed;

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
          color: theme.colors.system.primary,
        ),
        child: BodyBold(text, color: theme.colors.system.textOnColors),
      ),
    );
  }
}
