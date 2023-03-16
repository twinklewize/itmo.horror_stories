import 'package:horror_stories/src/core/models/models.dart';

class JoinGamePayload {
  final MoveModel currentMove;
  final List<TableCardJointGamePayload> tableCardsInfo;

  JoinGamePayload({
    required this.currentMove,
    required this.tableCardsInfo,
  });
}

class TableCardJointGamePayload {
  final Id tableCardId;
  final CardModel card;
  TableCardJointGamePayload({
    required this.tableCardId,
    required this.card,
  });
}
