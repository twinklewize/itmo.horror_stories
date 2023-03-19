import 'package:freezed_annotation/freezed_annotation.dart';

import '../table_card/table_card.dart';
import '../vote/vote.dart';

part 'table_cards_info.freezed.dart';

@freezed
class TableCardsInfoModel with _$TableCardsInfoModel {
  const factory TableCardsInfoModel({
    required List<TableCardModel> tableCards,
    @Default([]) List<VoteModel> votes,
  }) = _TableCardsInfoModel;

  const TableCardsInfoModel._();
}
