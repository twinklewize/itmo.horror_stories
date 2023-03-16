import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class AppTextTheme with EquatableMixin {
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle title4;
  final TextStyle bodyRegular;
  final TextStyle bodyBold;
  final TextStyle bodySmall;
  final TextStyle caption;

  const AppTextTheme({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.bodyRegular,
    required this.bodyBold,
    required this.bodySmall,
    required this.caption,
  });

  static AppTextTheme lerp(AppTextTheme a, AppTextTheme b, double t) {
    return AppTextTheme(
      title1: TextStyle.lerp(a.title1, b.title1, t)!,
      title2: TextStyle.lerp(a.title2, b.title2, t)!,
      title3: TextStyle.lerp(a.title3, b.title3, t)!,
      title4: TextStyle.lerp(a.title4, b.title4, t)!,
      bodyRegular: TextStyle.lerp(a.bodyRegular, b.bodyRegular, t)!,
      bodyBold: TextStyle.lerp(a.bodyBold, b.bodyBold, t)!,
      bodySmall: TextStyle.lerp(a.bodySmall, b.bodySmall, t)!,
      caption: TextStyle.lerp(a.caption, b.caption, t)!,
    );
  }

  @override
  List<Object?> get props {
    return [
      title1,
      title2,
      title3,
      title4,
      bodyRegular,
      bodyBold,
      bodySmall,
      caption,
    ];
  }
}
