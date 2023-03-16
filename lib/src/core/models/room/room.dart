import 'package:freezed_annotation/freezed_annotation.dart';

import '../players_info/players_info.dart';
import '../room_info/room_info.dart';

part 'room.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required RoomInfoModel roomInfo,
    required PlayersInfoModel playersInfo,
    @Default(false) bool isGameStarted,
  }) = _RoomModel;

  const RoomModel._();
}
