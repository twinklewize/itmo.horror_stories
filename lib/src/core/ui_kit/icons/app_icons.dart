import 'package:flutter/widgets.dart';

import 'base_icon.dart';

const _kDefaultSize = 80.0;

class AppIcons extends BaseIcon {
  AppIcons copyWith({
    Color? color,
    double? height,
    double? width,
    double? size,
  }) {
    return AppIcons.copyWith(
      this,
      color: color,
      height: height,
      width: width,
      size: size,
    );
  }

  AppIcons.copyWith(
    AppIcons icon, {
    Color? color,
    double? height,
    double? width,
    double? size,
  }) : super.copyWith(
          icon,
          color: color,
          height: height,
          width: width,
          size: size,
        );

  const AppIcons.start({
    double size = _kDefaultSize,
    Color? color,
  }) : super(
          assetPath: 'assets/vector/figma_icons/start.svg',
          size: size,
          color: color,
        );
}
