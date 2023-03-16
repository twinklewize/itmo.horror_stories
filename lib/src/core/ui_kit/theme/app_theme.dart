import 'package:flutter/widgets.dart';

import 'app_color_scheme.dart';
import 'app_text_theme.dart';

class AppTheme extends InheritedTheme {
  AppTheme({
    required AppTextTheme textTheme,
    required AppColorScheme colorScheme,
    required Widget child,
    Key? key,
  })  : data = AppThemeData(
          text: textTheme,
          colors: colorScheme,
        ),
        super(key: key, child: child);

  const AppTheme.fromAppThemeData({
    required this.data,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<AppTheme>()!.data;
    return data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ancestorTheme = context.findAncestorWidgetOfExactType<AppTheme>();
    return identical(this, ancestorTheme) ? child : AppTheme.fromAppThemeData(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => true;
}

class AppThemeData {
  AppThemeData({
    required this.text,
    required this.colors,
  });

  AppTextTheme text;

  AppColorScheme colors;

  static AppThemeData lerp(AppThemeData a, AppThemeData b, double t) {
    return AppThemeData(
      text: AppTextTheme.lerp(a.text, b.text, t),
      colors: AppColorScheme.lerp(a.colors, b.colors, t),
    );
  }
}
