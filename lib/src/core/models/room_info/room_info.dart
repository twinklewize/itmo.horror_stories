import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_info.freezed.dart';

@freezed
class RoomInfoModel with _$RoomInfoModel {
  const factory RoomInfoModel({
    required int roomCode,
    required int moveTime,
    required int placesCount,
  }) = _RoomInfoModel;

  const RoomInfoModel._();
}
