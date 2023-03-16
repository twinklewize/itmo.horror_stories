import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/features/main/data/repositories/game_repository.dart';
import 'package:injectable/injectable.dart';

part 'game_event.dart';
part 'game_state.dart';
part 'game_bloc.freezed.dart';

@singleton
class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository gameRepository;
  GameBloc(this.gameRepository) : super(const _GameInitialState()) {
    on<GameEvent>(
      (event, emit) => event.map(
        addHint: (event) => _addHint(event, emit),
        restoreGame: (event) => _restoreGame(event, emit),
        startGame: (event) => _startGame(event, emit),
        updateGame: (event) => _updateRoomState(event, emit),
        vote: (event) => _vote(event, emit),
        joinGame: (event) => _joinGame(event, emit),
      ),
    );
  }

  Future<void> _joinGame(
    _GameJoinEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final roomCode = state.game?.room.roomInfo.roomCode;
      if (roomCode != null) {
        // final joinGameDTO = await gameRepository.joinGame(event.room.roomInfo.roomCode);
      }
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
    }
  }

  Future<void> _addHint(
    _GameAddHintEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final roomCode = state.game?.room.roomInfo.roomCode;
      if (roomCode != null) {
        await gameRepository.addHint(
          roomCode: roomCode,
          cardName: event.cardName,
          hintStatus: event.hintStatus,
        );
      }
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
    }
  }

  Future<void> _restoreGame(
    _GameRestoreEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      // final restoreGameDTO = await gameRepository.restoreGameState(event.roomInfo.roomCode);
      // emit(GameState.succeeded(game));
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
    }
  }

  Future<void> _startGame(
    _GameStartEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      // final startGameDTO = await gameRepository.startGame(event.room.roomInfo.roomCode);
      // emit(GameState.succeeded(game));
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
    }
  }

  Future<void> _updateRoomState(
    _GameUpdateEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final game = state.game;
      if (game != null) {
        // final updateGameDTO = await gameRepository.updateGame(game.room.roomInfo.roomCode);
        emit(GameState.succeeded(game));
      } else {
        emit(const GameState.failed('Произошла ошибка'));
      }
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
    }
  }

  Future<void> _vote(
    _GameVoteEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final roomCode = state.game?.room.roomInfo.roomCode;
      if (roomCode != null) {
        await gameRepository.vote(event.tableCardId);
      }
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
    }
  }
}
