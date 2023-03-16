part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const GameState._();

  const factory GameState.initial() = _GameInitialState;
  const factory GameState.pending() = _GamePendingState;
  const factory GameState.succeeded(GameModel game) = _GameSucceededState;
  const factory GameState.failed(String message) = _GameFailedState;

  GameModel? get game {
    return maybeWhen(
      succeeded: (game) => game,
      orElse: () => null,
    );
  }

  GameStateIsTypeHelpers get isType {
    return GameStateIsTypeHelpers._(this);
  }
}

class GameStateIsTypeHelpers {
  final GameState _s;

  GameStateIsTypeHelpers._(this._s);

  bool get initial => _s is _GameInitialState;
  bool get pending => _s is _GamePendingState;
  bool get succeeded => _s is _GameSucceededState;
  bool get failed => _s is _GameFailedState;
}
