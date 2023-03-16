import 'package:flutter/widgets.dart';

import '../theme.dart';

class Title1 extends StatelessWidget {
  final Color? color;
  final int maxLines;
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const Title1(
    this.text, {
    this.color,
    this.overflow,
    this.textAlign,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Typography(
      text,
      style: theme.text.title1,
      color: color,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
