import 'package:freezed_annotation/freezed_annotation.dart';

import '../card/card.dart';

part 'hint_card.freezed.dart';

enum HintStatus {
  connected,
  notConnected,
  hand,
}

@freezed
class HintCardModel with _$HintCardModel {
  const factory HintCardModel({
    required CardModel card,
    required HintStatus hintStatus,
  }) = _HintCardModel;

  const HintCardModel._();
}
