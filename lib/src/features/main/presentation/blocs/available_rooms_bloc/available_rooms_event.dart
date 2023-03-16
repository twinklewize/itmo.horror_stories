part of 'available_rooms_bloc.dart';

@freezed
class AvailableRoomsEvent with _$AvailableRoomsEvent {
  const factory AvailableRoomsEvent.getAvailableRooms() = _AvailableRoomsGetEvent;
  const factory AvailableRoomsEvent.updateAvailableRooms() = _AvailableRoomsUpdateEvent;
}
