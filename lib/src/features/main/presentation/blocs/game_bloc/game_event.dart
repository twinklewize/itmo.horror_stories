part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.restoreGame({
    required RoomInfoModel roomInfo,
    required String userNickname,
  }) = _GameRestoreEvent;
  const factory GameEvent.startGame(RoomModel room) = _GameStartEvent;
  const factory GameEvent.joinGame(RoomModel room) = _GameJoinEvent;
  const factory GameEvent.updateGame() = _GameUpdateEvent;

  const factory GameEvent.vote(Id tableCardId) = _GameVoteEvent;
  const factory GameEvent.addHint({required String cardName, required HintStatus hintStatus}) = _GameAddHintEvent;
}
