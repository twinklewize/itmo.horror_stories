import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

@immutable
abstract class DefaultIcon extends StatelessWidget {
  const DefaultIcon({
    Key? key,
  }) : super(key: key);

  const DefaultIcon.copyWith(
    DefaultIcon baseIcon, {
    Color? color,
    double? size,
    double? width,
    double? height,
    Key? key,
  }) : super(key: key);
}

abstract class BaseIcon extends DefaultIcon {
  final String _assetPath;

  final double width;
  final double height;
  final Color? color;
  final double? squareWrapperSize;

  // ignore: use_key_in_widget_constructors
  const BaseIcon({
    required String assetPath,
    double? height,
    double? width,
    double? size,
    this.squareWrapperSize,
    this.color,
  })  :
        // NOTE: Only size or height at the moment
        assert((size != null) != (height != null)),
        // NOTE: Only size or width at the moment
        assert((size != null) != (width != null)),
        height = (size ?? height) as double,
        width = (size ?? width) as double,
        _assetPath = assetPath;

  // ignore: use_key_in_widget_constructors
  BaseIcon.copyWith(
    BaseIcon baseIcon, {
    Color? color,
    double? height,
    double? width,
    double? size,
  }) : this(
          assetPath: baseIcon._assetPath,
          height: height ?? size ?? baseIcon.height,
          width: width ?? size ?? baseIcon.width,
          squareWrapperSize: baseIcon.squareWrapperSize,
          color: color ?? baseIcon.color,
        );

  @override
  Widget build(BuildContext context) {
    // final theme = AppTheme.of(context);

    final svg = Center(
      child: SvgPicture.asset(
        _assetPath,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
          color ?? const Color(0xFF000000),
          BlendMode.srcIn,
        ),
      ),
    );

    if (squareWrapperSize == null) {
      return svg;
    }

    return SizedBox(
      height: squareWrapperSize,
      width: squareWrapperSize,
      child: Center(
        child: svg,
      ),
    );
  }
}
