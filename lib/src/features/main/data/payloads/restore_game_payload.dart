import 'package:horror_stories/src/core/models/models.dart';

class RestoreGamePayload {
  final List<HintCardModel> hintCards;
  final MoveModel currentMove;
  final TableCardsInfoModel tableCardsInfo;
  final List<PlayerModel> otherPlayers;
  final Id playerId;
  final Id masterId;

  RestoreGamePayload({
    required this.hintCards,
    required this.currentMove,
    required this.tableCardsInfo,
    required this.otherPlayers,
    required this.playerId,
    required this.masterId,
  });
}
