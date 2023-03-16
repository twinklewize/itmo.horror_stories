import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horror_stories/src/core/models/room_list_item/room_list_item.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/active_rooms_bloc/active_rooms_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/default_table.dart';
import 'active_rooms_screen_presenter.dart';

class ActiveRoomsScreen extends StatelessWidget {
  const ActiveRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ActiveRoomsScreenPresenter(
      child: BlocBuilder<ActiveRoomsBloc, ActiveRoomsState>(
        bloc: getIt.get(),
        builder: (context, state) {
          return state.maybeMap(
            succeeded: (state) => ActiveRoomsScreenSucceededState(activeRooms: state.activeRooms),
            orElse: () => const ActiveRoomsScreenPendingState(),
          );
        },
      ),
    );
  }
}

class ActiveRoomsScreenSucceededState extends StatelessWidget {
  const ActiveRoomsScreenSucceededState({
    super.key,
    required this.activeRooms,
  });
  final List<RoomListItemModel> activeRooms;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        const Title2('Ваши игры'),
        UIBox.base12x,
        DefaultTable(
          rooms: activeRooms,
          onPressed: ActiveRoomsScreenPresenter.of(context).restoreGame,
        ),
        UIBox.base12x,
        DoubleButton(
          onPressed1: ActiveRoomsScreenPresenter.of(context).openMainScreen,
          text1: 'Назад',
          onPressed2: ActiveRoomsScreenPresenter.of(context).openCreateRoomScreen,
          text2: 'Новая игра',
        ),
      ],
    );
  }
}

class ActiveRoomsScreenPendingState extends StatelessWidget {
  const ActiveRoomsScreenPendingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DefaultLayout(
      children: [
        const Title2('Ваши игры'),
        const Spacer(),
        const Title2('Загрузка'),
        UIBox.base8x,
        LoadingAnimationWidget.halfTriangleDot(
          color: theme.colors.system.text,
          size: UISize.base16x,
        ),
        const Spacer(),
        DoubleButton(
          onPressed1: ActiveRoomsScreenPresenter.of(context).openMainScreen,
          text1: 'Назад',
          onPressed2: ActiveRoomsScreenPresenter.of(context).openCreateRoomScreen,
          text2: 'Новая игра',
        ),
      ],
    );
  }
}
