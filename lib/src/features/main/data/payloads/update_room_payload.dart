import 'package:horror_stories/src/core/models/models.dart';

class UpdateRoomPayload {
  final List<PlayerModel> otherPlayers;
  final bool? isGameStarted; // возвращается только если true
  final Id? masterId; // возвращается если игрок выбран

  UpdateRoomPayload({
    required this.otherPlayers,
    this.isGameStarted,
    this.masterId,
  });
}
