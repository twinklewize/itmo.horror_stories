import '../constants/figma_colors.dart';
import '../constants/figma_typography.dart';
import '../ui_kit.dart';

const _textTheme = AppTextTheme(
  bodyRegular: FigmaTypography.bodyRegular,
  bodyBold: FigmaTypography.bodyBold,
  bodySmall: FigmaTypography.bodySmall,
  caption: FigmaTypography.caption,
  title1: FigmaTypography.title1,
  title2: FigmaTypography.title2,
  title3: FigmaTypography.title3,
  title4: FigmaTypography.title4,
);

class GlobalTheme {
  static AppThemeData getTheme() {
    return AppThemeData(
      text: _textTheme,
      colors: AppColorScheme(
        system: SystemColors(
          background: FigmaColors.background,
          primary: FigmaColors.primary,
          surface: FigmaColors.surface,
          dark: FigmaColors.dark,
          secondary: FigmaColors.secondary,
          surfaceDark: FigmaColors.surfaceDark,
          text: FigmaColors.text,
          textOnColors: FigmaColors.textOnColors,
        ),
      ),
    );
  }
}
