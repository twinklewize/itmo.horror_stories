import 'package:horror_stories/src/core/models/models.dart';

class JoinGamePayload {
  final List<HintCardModel> hintCards;
  final MoveModel currentMove;
  final List<Id> otherActivePlayersIds;
  final TableCardsInfoModel tableCardsInfo;

  JoinGamePayload({
    required this.hintCards,
    required this.currentMove,
    required this.otherActivePlayersIds,
    required this.tableCardsInfo,
  });
}
