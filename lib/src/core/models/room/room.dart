import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';

part 'room.freezed.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    required RoomInfoModel roomInfo,
    required List<PlayerModel> players,
    @Default(false) bool isGameStarted,
  }) = _RoomModel;

  const RoomModel._();
}
