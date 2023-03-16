import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class SystemColors with EquatableMixin {
  final Color background;

  final Color surface;
  final Color surfaceDark;

  final Color primary;
  final Color secondary;
  final Color dark;

  final Color text;
  final Color text40;
  final Color text20;

  final Color textOnColors;

  SystemColors({
    required this.background,
    required this.surface,
    required this.surfaceDark,
    required this.primary,
    required this.secondary,
    required this.dark,
    required this.text,
    required this.textOnColors,
  })  : text40 = text.withOpacity(0.4),
        text20 = text.withOpacity(0.2);

  static SystemColors lerp(SystemColors a, SystemColors b, double t) {
    return SystemColors(
      background: Color.lerp(a.background, b.background, t)!,
      surface: Color.lerp(a.surface, b.surface, t)!,
      surfaceDark: Color.lerp(a.surfaceDark, b.surfaceDark, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      dark: Color.lerp(a.dark, b.dark, t)!,
      text: Color.lerp(a.text, b.text, t)!,
      textOnColors: Color.lerp(a.textOnColors, b.textOnColors, t)!,
    );
  }

  @override
  List<Object?> get props {
    return [
      background,
      surface,
      surfaceDark,
      primary,
      secondary,
      dark,
      primary,
      text,
      textOnColors,
    ];
  }
}
