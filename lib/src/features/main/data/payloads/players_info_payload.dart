import 'package:horror_stories/src/core/models/models.dart';

class JoinGamePayload {
  final MoveModel currentMove;
  final TableCardsInfoModel tableCardsInfo;

  JoinGamePayload({
    required this.currentMove,
    required this.tableCardsInfo,
  });
}
