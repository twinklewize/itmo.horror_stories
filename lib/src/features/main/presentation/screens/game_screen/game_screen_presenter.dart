import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/game_bloc/game_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart';

class GameScreenPresenter extends StatefulWidget {
  static GameScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<GameScreenPresenterState>()!;
  }

  final Widget child;

  const GameScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<GameScreenPresenter> createState() => GameScreenPresenterState();
}

class GameScreenPresenterState extends State<GameScreenPresenter> {
  late RoomBloc _roomBloc;
  late GameBloc _gameBloc;
  Timer? _updateGameStateTimer;
  Timer? _updateRemainingTimeTimer;

  void _stopTimers() {
    _updateGameStateTimer?.cancel();
    _updateRemainingTimeTimer?.cancel();
  }

  void _startTimers() {
    _updateGameStateTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => _updateGameState(),
    );
    _updateRemainingTimeTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _gameBloc.add(const GameEvent.tick()),
    );
  }

  @override
  void initState() {
    super.initState();
    _roomBloc = getIt.get();
    _gameBloc = getIt.get();

    _startTimers();
  }

  @override
  void activate() {
    super.activate();
    _startTimers();
  }

  @override
  void dispose() {
    super.dispose();
    _stopTimers();
  }

  @override
  void deactivate() {
    super.deactivate();
    _stopTimers();
  }

  void leaveRoom() {
    final roomCode = _gameBloc.state.game?.room.roomInfo.roomCode;
    if (roomCode != null) {
      _roomBloc.add(RoomEvent.leaveRoom(roomCode));
    }
    _stopTimers();
    context.push(RoutePaths.main);
  }

  void vote(Id tableCardId) {
    _gameBloc.add(GameEvent.vote(tableCardId));
  }

  void addHint(HintCardModel hintCard) {
    _gameBloc.add(GameEvent.addHint(
      cardName: hintCard.card.cardName,
      hintStatus: hintCard.hintStatus,
    ));
  }

  void openMainScreen() {
    _stopTimers();
    context.push(RoutePaths.main);
  }

  void _updateGameState() {
    if (_gameBloc.state.game?.currentMove.isGameOver == true) {
      _stopTimers();
    }
    _gameBloc.add(const GameEvent.updateGame());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
