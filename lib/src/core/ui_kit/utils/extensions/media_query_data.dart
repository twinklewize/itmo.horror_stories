part of '../utils.dart';

extension SafeBottomPadding on MediaQueryData {
  double safeBottomPadding() {
    final showingKeyboard = viewInsets.bottom != 0.0;
    if (showingKeyboard) {
      return UISize.base4x;
    }
    final bottomPadding = viewPadding.bottom;
    return bottomPadding != 0.0 ? bottomPadding : UISize.base4x;
  }

  double safeBottomPaddingWithKeyboard() {
    final showingKeyboard = viewInsets.bottom != 0.0;
    if (showingKeyboard) {
      return viewInsets.bottom + UISize.base4x;
    }
    return safeBottomPadding();
  }

  // Note: Bad realization
  double safeTopPadding() {
    if (viewPadding.top > UISize.base8x) {
      return viewPadding.top;
    } else {
      return viewPadding.top + UISize.base2x;
    }
  }
}
