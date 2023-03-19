import 'package:freezed_annotation/freezed_annotation.dart';

part 'move.freezed.dart';

enum GamePhase {
  voting,
  hints,
}

@freezed
class MoveModel with _$MoveModel {
  const factory MoveModel({
    @Default(1) int roundNumber,
    @Default(GamePhase.hints) GamePhase phase,
    required int remainingTime,
    @Default(null) int? cardsToRemoveCount,
    @Default(false) bool isGameOver,
  }) = _MoveModel;

  const MoveModel._();
}
