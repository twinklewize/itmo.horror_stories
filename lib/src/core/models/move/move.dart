import 'package:freezed_annotation/freezed_annotation.dart';

part 'move.freezed.dart';

enum GamePhase {
  voting,
  hints,
}

@freezed
class MoveModel with _$MoveModel {
  const factory MoveModel({
    required int roundNumber,
    required GamePhase phase,
    required int remainingTime,
    required int cardsToRemoveCount,
  }) = _MoveModel;

  const MoveModel._();
}
