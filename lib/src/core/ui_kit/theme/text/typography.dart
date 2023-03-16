import 'package:flutter/widgets.dart';

import '../theme.dart';

class Typography extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const Typography(
    this.text, {
    required this.style,
    this.color,
    this.maxLines = 1,
    this.textAlign,
    this.overflow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nextColor = color ?? AppTheme.of(context).colors.system.text;

    return Text(
      text,
      style: style.copyWith(color: nextColor, inherit: false),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
