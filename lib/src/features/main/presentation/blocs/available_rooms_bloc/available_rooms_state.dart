part of 'available_rooms_bloc.dart';

@freezed
class AvailableRoomsState with _$AvailableRoomsState {
  const factory AvailableRoomsState.initial() = _AvailableRoomsInitialState;
  const factory AvailableRoomsState.pending() = _AvailableRoomsPendingState;
  const factory AvailableRoomsState.succeeded(List<RoomListItemModel> availableRooms) = _AvailableRoomsSucceededState;
  const factory AvailableRoomsState.failed(String message) = _AvailableRoomsFailedState;
}
