import 'package:horror_stories/src/core/models/models.dart';

class GetAvailableRoomsPayload {
  final List<RoomListItemModel> availableRooms;

  GetAvailableRoomsPayload({
    required this.availableRooms,
  });
}
