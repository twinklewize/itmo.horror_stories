import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';

part 'room_list_item.freezed.dart';

@freezed
class RoomListItemModel with _$RoomListItemModel {
  const factory RoomListItemModel({
    required RoomInfoModel roomInfo,
    required int playersCount,
  }) = _RoomListItemModel;

  const RoomListItemModel._();
}
