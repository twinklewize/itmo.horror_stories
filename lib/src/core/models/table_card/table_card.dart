import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/id/id.dart';

import '../card/card.dart';

part 'table_card.freezed.dart';

@freezed
class TableCardModel with _$TableCardModel {
  const factory TableCardModel({
    required Id tableCardId,
    required CardModel card,
    @Default(true) bool isOnTable,
    @Default(false) bool canBeVoted,
    @Default(false) bool isSelected,
    @Default(0) int votesCount,
  }) = _TableCardModel;

  const TableCardModel._();
}
