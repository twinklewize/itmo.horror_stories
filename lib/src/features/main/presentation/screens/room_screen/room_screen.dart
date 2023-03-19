import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart';
import 'package:horror_stories/src/features/main/presentation/screens/room_screen/widgets/room_title_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'room_screen_presenter.dart';
import '../../widgets/players.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RoomScreenPresenter(
      child: BlocBuilder<RoomBloc, RoomState>(
        bloc: getIt.get(),
        builder: (context, state) {
          return state.maybeMap(
            succeeded: (state) => RoomScreenSucceededState(room: state.room),
            orElse: () => const RoomScreenPendingState(),
          );
        },
      ),
    );
  }
}

class RoomScreenSucceededState extends StatelessWidget {
  const RoomScreenSucceededState({
    required this.room,
    super.key,
  });

  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    final isMaster = room.players.where((element) => element.isMaster && element.isPlayer).isNotEmpty == true;

    return DecorativeLayout(
      children: [
        RoomTitleWidget(roomCode: room.roomInfo.roomCode),
        UIBox.base8x,
        BodyRegular('Ход: ${room.roomInfo.moveTime} c'),
        UIBox.base8x,
        PlayersWidget(
          players: room.players,
          placesCount: room.roomInfo.placesCount,
        ),
        UIBox.base8x,
        if (isMaster)
          PrimaryButton(
            text: 'Начать игру',
            onPressed: RoomScreenPresenter.of(context).startGame,
          ),
        UIBox.base8x,
        SecondaryButton(
          text: 'Покинуть комнату',
          onPressed: RoomScreenPresenter.of(context).leaveRoom,
        )
      ],
    );
  }
}

class RoomScreenPendingState extends StatelessWidget {
  const RoomScreenPendingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DecorativeLayout(
      children: [
        const Spacer(),
        LoadingAnimationWidget.halfTriangleDot(color: theme.colors.system.text, size: UISize.base16x),
        const Spacer(),
        SecondaryButton(
          text: 'Покинуть комнату',
          onPressed: RoomScreenPresenter.of(context).leaveRoom,
        )
      ],
    );
  }
}
