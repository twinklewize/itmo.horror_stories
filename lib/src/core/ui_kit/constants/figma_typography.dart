import 'package:flutter/widgets.dart';

const kFontFamilyTitle = 'Yeseva One';
const kFontFamilBody = 'Comfortaa';

class FigmaTypography {
  static const title1 = TextStyle(
    fontFamily: kFontFamilyTitle,
    fontSize: 64,
    fontWeight: FontWeight.w400,
    letterSpacing: 24,
  );
  static const title2 = TextStyle(
    fontFamily: kFontFamilyTitle,
    fontSize: 48,
    fontWeight: FontWeight.w400,
    letterSpacing: 8,
  );
  static const title3 = TextStyle(
    fontFamily: kFontFamilyTitle,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static const title4 = TextStyle(
    fontFamily: kFontFamilyTitle,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const bodyRegular = TextStyle(
    fontFamily: kFontFamilBody,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const bodyBold = TextStyle(
    fontFamily: kFontFamilBody,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const bodySmall = TextStyle(
    fontFamily: kFontFamilBody,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const caption = TextStyle(
    fontFamily: kFontFamilBody,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
}
