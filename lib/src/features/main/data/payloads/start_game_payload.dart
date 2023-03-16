import 'package:horror_stories/src/core/models/models.dart';

class StartGamePayload {
  final List<CardModel> hintCards;
  final int remainingTime;
  final Id selectedCardId;
  final List<TableCardStartGamePayload> tableCards;

  StartGamePayload({
    required this.hintCards,
    required this.selectedCardId,
    required this.tableCards,
    required this.remainingTime,
    required MoveModel currentMove,
  });
}

class TableCardStartGamePayload {
  final Id tableCardId;
  final CardModel card;
  TableCardStartGamePayload({
    required this.tableCardId,
    required this.card,
  });
}
