import 'package:horror_stories/src/core/models/models.dart';

class JoinRoomPayload {
  final List<PlayerModel> otherPlayers;
  final Id playerId;
  final Id? masterId;

  JoinRoomPayload({
    required this.otherPlayers,
    required this.playerId,
    this.masterId,
  });
}
