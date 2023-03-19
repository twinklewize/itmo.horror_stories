import 'package:horror_stories/src/core/models/models.dart';

class UpdateRoomPayload {
  final List<PlayerModel> players;
  final bool isGameStarted; // возвращается только если true

  UpdateRoomPayload({
    required this.players,
    required this.isGameStarted,
  });
}
