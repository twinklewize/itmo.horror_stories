part of '../widgets.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/raster/background.png'),
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
        color: theme.colors.system.background,
      ),
      child: child,
    );
  }
}
