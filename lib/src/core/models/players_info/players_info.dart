import 'package:freezed_annotation/freezed_annotation.dart';

import '../id/id.dart';
import '../player/player.dart';

part 'players_info.freezed.dart';

@freezed
class PlayersInfoModel with _$PlayersInfoModel {
  const factory PlayersInfoModel({
    required Id playerId,
    @Default([]) List<PlayerModel> players,
    @Default(null) Id? masterId,
  }) = _PlayersInfoModel;

  const PlayersInfoModel._();
}
