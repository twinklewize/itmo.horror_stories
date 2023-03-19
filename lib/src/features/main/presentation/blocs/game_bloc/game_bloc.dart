import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/features/main/data/repositories/game_repository.dart';
import 'package:horror_stories/src/features/main/presentation/widgets/toast.dart';
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
        startGame: (event) => _startGame(event, emit),
        joinGame: (event) => _joinGame(event, emit),
        restoreGame: (event) => _restoreGame(event, emit),
        updateGame: (event) => _updateGame(event, emit),
        addHint: (event) => _addHint(event, emit),
        vote: (event) => _vote(event, emit),
        tick: (event) => _tick(event, emit),
      ),
      transformer: sequential(),
    );
  }

  Future<void> _tick(
    _GameTickEvent event,
    Emitter<GameState> emit,
  ) async {
    final game = state.game;
    if (game != null) {
      var newRemainingTime = game.currentMove.remainingTime - 1;
      newRemainingTime = newRemainingTime < 0 ? 0 : newRemainingTime;
      final newGame = game.copyWith(currentMove: game.currentMove.copyWith(remainingTime: newRemainingTime));
      emit(GameState.succeeded(newGame));
    }
  }

  Future<void> _joinGame(
    _GameJoinEvent event,
    Emitter<GameState> emit,
  ) async {
    emit(const GameState.pending());
    try {
      final game = await gameRepository.joinGame(event.room);
      emit(GameState.succeeded(game));
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
      BotToast.showWidget(
        toastBuilder: (_) => Toast(text: e.toString()),
      );
    }
  }

  Future<void> _restoreGame(
    _GameRestoreEvent event,
    Emitter<GameState> emit,
  ) async {
    emit(const GameState.pending());
    try {
      final game = await gameRepository.restoreGame(
        nickname: event.userNickname,
        roomInfo: event.roomInfo,
      );
      emit(GameState.succeeded(game));
      if (game.currentMove.isGameOver) {
        BotToast.showWidget(
          toastBuilder: (_) => const Toast(
            text: 'Игра окончена',
            isDark: false,
          ),
        );
      }
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
      BotToast.showWidget(
        toastBuilder: (_) => Toast(text: e.toString()),
      );
    }
  }

  Future<void> _startGame(
    _GameStartEvent event,
    Emitter<GameState> emit,
  ) async {
    emit(const GameState.pending());
    try {
      final game = await gameRepository.startGame(event.room);
      emit(GameState.succeeded(game));
    } catch (e) {
      emit(const GameState.failed('Произошла ошибка'));
      BotToast.showWidget(
        toastBuilder: (_) => Toast(text: e.toString()),
      );
    }
  }

  Future<void> _addHint(
    _GameAddHintEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final game = state.game;
      if (game != null) {
        final newGame = await gameRepository.addHint(
          game: game,
          cardName: event.cardName,
          hintStatus: event.hintStatus,
        );
        emit(GameState.succeeded(newGame));
      }
    } catch (e) {
      BotToast.showWidget(
        toastBuilder: (_) => Toast(text: e.toString()),
      );
    }
  }

  Future<void> _updateGame(
    _GameUpdateEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final game = state.game;
      if (game != null) {
        final newGame = await gameRepository.updateGame(game);
        emit(GameState.succeeded(newGame));
        if (newGame.currentMove.isGameOver) {
          BotToast.showWidget(
            toastBuilder: (_) => const Toast(
              text: 'Игра окончена',
              isDark: false,
            ),
          );
        }
      }
    } catch (e) {
      BotToast.showWidget(toastBuilder: (_) => Toast(text: e.toString()));
    }
  }

  Future<void> _vote(
    _GameVoteEvent event,
    Emitter<GameState> emit,
  ) async {
    try {
      final game = state.game;
      if (game != null) {
        final newGame = await gameRepository.vote(
          game: game,
          tableCardId: event.tableCardId,
        );
        emit(GameState.succeeded(newGame));
      }
    } catch (e) {
      BotToast.showWidget(
        toastBuilder: (_) => Toast(text: e.toString()),
      );
    }
  }
}
