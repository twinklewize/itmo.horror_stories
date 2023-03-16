part of 'active_rooms_bloc.dart';

@freezed
class ActiveRoomsState with _$ActiveRoomsState {
  const factory ActiveRoomsState.initial() = _ActiveRoomsInitialState;
  const factory ActiveRoomsState.pending() = _ActiveRoomsPendingState;
  const factory ActiveRoomsState.succeeded(List<RoomListItemModel> activeRooms) = _ActiveRoomsSucceededState;
  const factory ActiveRoomsState.failed(String message) = _ActiveRoomsFailedState;
}

class ActiveRoomsStateIsTypeHelpers {
  final ActiveRoomsState _s;

  ActiveRoomsStateIsTypeHelpers._(this._s);

  bool get initial => _s is _ActiveRoomsInitialState;
  bool get pending => _s is _ActiveRoomsPendingState;
  bool get succeeded => _s is _ActiveRoomsSucceededState;
  bool get failed => _s is _ActiveRoomsFailedState;
}
