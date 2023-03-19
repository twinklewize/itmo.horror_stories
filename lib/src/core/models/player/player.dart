import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part 'player.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required Id playerId,
    required String nickname,
    @Default(false) isMaster,
    @Default(false) isPlayer,
  }) = _PlayerModel;

  const PlayerModel._();
}
