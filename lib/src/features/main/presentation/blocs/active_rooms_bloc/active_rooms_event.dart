part of 'active_rooms_bloc.dart';

@freezed
class ActiveRoomsEvent with _$ActiveRoomsEvent {
  const factory ActiveRoomsEvent.getActiveRooms() = _ActiveRoomsGetEvent;
  const factory ActiveRoomsEvent.updateActiveRooms() = _ActiveRoomsUpdateEvent;
}
