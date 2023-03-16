import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/navigation/navigation.dart';
import 'package:horror_stories/src/features/main/presentation/blocs/room_bloc/room_bloc.dart';

class CreateRoomScreenPresenter extends StatefulWidget {
  static CreateRoomScreenPresenterState of(BuildContext context) {
    return context.findAncestorStateOfType<CreateRoomScreenPresenterState>()!;
  }

  final Widget child;

  const CreateRoomScreenPresenter({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<CreateRoomScreenPresenter> createState() => CreateRoomScreenPresenterState();
}

class CreateRoomScreenPresenterState extends State<CreateRoomScreenPresenter> {
  late RoomBloc _roomBloc;

  final codeController = TextEditingController();
  final moveTimeController = TextEditingController();
  final placesCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _roomBloc = getIt.get();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void openActiveGamesScreen() {
    context.push(RoutePaths.activeGames);
  }

  void createRoom() {
    final roomCode = int.parse(codeController.value.text);
    final moveTime = int.parse(codeController.value.text);
    final placesCount = int.parse(codeController.value.text);

    // if (moveTime < 30 || moveTime > 120 || placesCount < 2 || placesCount > 10 || userNickname == null) {
    //   return;
    // }

    final roomInfo = RoomInfoModel(
      roomCode: roomCode,
      moveTime: moveTime,
      placesCount: placesCount,
    );

    _roomBloc.add(RoomEvent.createRoom(roomInfo));

    _roomBloc.stream
        .firstWhere(
          (state) => state.maybeMap(
            pending: (_) => false,
            succeeded: (_) => true,
            orElse: () => true,
          ),
        )
        .then((value) => context.push(RoutePaths.room));
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
