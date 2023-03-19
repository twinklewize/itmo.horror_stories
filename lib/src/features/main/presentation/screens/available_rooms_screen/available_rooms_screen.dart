import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/available_rooms_bloc/available_rooms_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/default_table.dart';
import 'available_rooms_screen_presenter.dart';

class AvailableRoomsScreen extends StatelessWidget {
  const AvailableRoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AvailableRoomsScreenPresenter(
      child: BlocBuilder<AvailableRoomsBloc, AvailableRoomsState>(
        bloc: getIt.get(),
        builder: (context, state) {
          return state.maybeMap(
            succeeded: (state) => AvailableRoomsScreenSucceededState(availableRooms: state.availableRooms),
            orElse: () => const AvailableRoomsScreenPendingState(),
          );
        },
      ),
    );
  }
}

class AvailableRoomsScreenSucceededState extends StatelessWidget {
  const AvailableRoomsScreenSucceededState({
    required this.availableRooms,
    super.key,
  });
  final List<RoomListItemModel> availableRooms;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      children: [
        const Title2('Доступные комнаты'),
        UIBox.base12x,
        DefaultTable(
          rooms: availableRooms,
          onPressed: AvailableRoomsScreenPresenter.of(context).joinRoom,
        ),
        UIBox.base12x,
        SecondaryButton(
          onPressed: AvailableRoomsScreenPresenter.of(context).openMainScreen,
          text: 'Назад',
        ),
      ],
    );
  }
}

class AvailableRoomsScreenPendingState extends StatelessWidget {
  const AvailableRoomsScreenPendingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return DefaultLayout(
      children: [
        const Title2('Доступные комнаты'),
        const Spacer(),
        LoadingAnimationWidget.halfTriangleDot(color: theme.colors.system.text, size: UISize.base16x),
        const Spacer(),
        SecondaryButton(
          onPressed: AvailableRoomsScreenPresenter.of(context).openMainScreen,
          text: 'Назад',
        ),
      ],
    );
  }
}
