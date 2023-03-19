part of 'utils.dart';

abstract class UISize {
  /// 4.0
  static const base = 4.0;

  /// 8.0
  static const base2x = base * 2;

  /// 12.0
  static const base3x = base * 3;

  /// 16.0
  static const base4x = base * 4;

  /// 20.0
  static const base5x = base * 5;

  /// 24.0
  static const base6x = base * 6;

  /// 28.0
  static const base7x = base * 7;

  /// 32.0
  static const base8x = base * 8;

  /// 36.0
  static const base9x = base * 9;

  /// 40.0
  static const base10x = base * 10;

  /// 44.0
  static const base11x = base * 11;

  /// 48.0
  static const base12x = base * 12;

  /// 52.0
  static const base13x = base * 13;

  /// 56.0
  static const base14x = base * 14;

  /// 60.0
  static const base15x = base * 15;

  /// 64.0
  static const base16x = base * 16;
}

abstract class UIBox {
  /// dimension: 4.0
  static const base = SizedBox.square(dimension: UISize.base);

  /// dimension: 8.0
  static const base2x = SizedBox.square(dimension: UISize.base2x);

  /// dimension: 12.0
  static const base3x = SizedBox.square(dimension: UISize.base3x);

  /// dimension: 16.0
  static const base4x = SizedBox.square(dimension: UISize.base4x);

  /// dimension: 20.0
  static const base5x = SizedBox.square(dimension: UISize.base5x);

  /// dimension: 24.0
  static const base6x = SizedBox.square(dimension: UISize.base6x);

  /// dimension: 28.0
  static const base7x = SizedBox.square(dimension: UISize.base7x);

  /// dimension: 32.0
  static const base8x = SizedBox.square(dimension: UISize.base8x);

  /// dimension: 36.0
  static const base9x = SizedBox.square(dimension: UISize.base9x);

  /// dimension: 40.0
  static const base10x = SizedBox.square(dimension: UISize.base10x);

  /// dimension: 44.0
  static const base11x = SizedBox.square(dimension: UISize.base10x);

  /// dimension: 48.0
  static const base12x = SizedBox.square(dimension: UISize.base10x);

  /// dimension: 52.0
  static const base13x = SizedBox.square(dimension: UISize.base10x);

  /// dimension: 56.0
  static const base14x = SizedBox.square(dimension: UISize.base10x);
}

abstract class UIShadow {
  static const thin = <BoxShadow>[
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
      color: Color(0x14000000), // Opacity 20
    ),
    BoxShadow(
      offset: Offset(0, -1),
      blurRadius: 5,
      spreadRadius: 0,
      color: Color(0x08000000), // Opacity 8
    ),
  ];

  static const button = <BoxShadow>[
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 5,
      spreadRadius: 0,
      color: Color(0x00000000),
    ),
  ];

  static const cards = <BoxShadow>[
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
      color: Color(0x1A000000),
    ),
  ];
}

abstract class UIAnimation {
  /// milliseconds: 100
  static const baseDuration = Duration(milliseconds: 100);

  /// milliseconds: 200
  static const baseDuration2x = Duration(milliseconds: 200);

  /// milliseconds: 400
  static const baseBottomSheetAnimationDuration = Duration(milliseconds: 400);

  /// Curves.easeInOut
  static const baseCurve = Curves.easeInOut;
}
