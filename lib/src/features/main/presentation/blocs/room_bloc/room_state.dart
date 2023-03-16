part of 'room_bloc.dart';

@freezed
class RoomState with _$RoomState {
  const RoomState._();
  const factory RoomState.initial() = _RoomInitialState;
  const factory RoomState.pending() = _RoomPendingState;
  const factory RoomState.succeeded(RoomModel room) = _RoomsSucceededState;
  const factory RoomState.failed(String message) = _RoomFailedState;

  RoomModel? get room {
    return maybeWhen(
      succeeded: (room) => room,
      orElse: () => null,
    );
  }
}
