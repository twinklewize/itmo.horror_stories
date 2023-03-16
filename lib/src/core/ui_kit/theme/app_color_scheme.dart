import 'package:equatable/equatable.dart';

import 'colors/system_colors.dart';

class AppColorScheme with EquatableMixin {
  final SystemColors system;

  const AppColorScheme({
    required this.system,
  });

  static AppColorScheme lerp(AppColorScheme a, AppColorScheme b, double t) {
    return AppColorScheme(
      system: SystemColors.lerp(a.system, b.system, t),
    );
  }

  @override
  List<Object?> get props {
    return [system];
  }
}
