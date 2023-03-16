import 'package:horror_stories/src/core/models/models.dart';

class UpdateGamePayload {
  final MoveModel currentMove;
  final List<Id> activeTableCardsIds;
  final List<Id> otherActivePlayersIds;
  final List<HintCardModel>? hintCards; // возвращает если игрок не мастер
  final Id? selectedCardId; // возвращает если игра закончена и игрок не мастер
  final List<VoteModel>? otherPlayersVotes; // возвращает если фаза голосования

  UpdateGamePayload({
    required this.currentMove,
    required this.activeTableCardsIds,
    required this.otherActivePlayersIds,
    this.hintCards,
    this.selectedCardId,
    this.otherPlayersVotes,
  });
}
