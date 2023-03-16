import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part 'game.freezed.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required RoomModel room,
    required MoveModel currentMove,
    required List<HintCardModel> hintCards,
    required TableCardsInfoModel tableCardsInfo,
  }) = _GameModel;

  const GameModel._();
}
