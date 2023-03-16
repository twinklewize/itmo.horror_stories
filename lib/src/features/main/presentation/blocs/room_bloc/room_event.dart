part of 'room_bloc.dart';

@freezed
class RoomEvent with _$RoomEvent {
  const factory RoomEvent.joinRoom({
    required RoomInfoModel roomInfo,
    required String userNickname,
  }) = _RoomJoinEvent;
  const factory RoomEvent.leaveRoom(int roomCode) = _RoomLeaveEvent;
  const factory RoomEvent.updateRoom() = _RoomUpdateEvent;
  const factory RoomEvent.createRoom(RoomInfoModel roomInfo) = _RoomCreateEvent;
}
