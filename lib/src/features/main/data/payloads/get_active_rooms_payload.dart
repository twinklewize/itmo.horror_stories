import 'package:horror_stories/src/core/models/models.dart';

class GetActiveRoomsPayload {
  final List<RoomListItemModel> activeRooms;

  GetActiveRoomsPayload({
    required this.activeRooms,
  });
}
