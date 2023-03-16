import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

class DefaultTable extends StatelessWidget {
  const DefaultTable({
    super.key,
    required this.rooms,
    required this.onPressed,
  });
  final List<RoomListItemModel> rooms;
  final Function(RoomInfoModel roomInfo) onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UISize.base4x),
          border: Border.all(color: theme.colors.system.surface),
        ),
        child: SingleChildScrollView(
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      height: UISize.base * 16,
                      child: BodyBold(
                        'Код',
                        color: theme.colors.system.secondary,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      height: UISize.base * 16,
                      child: BodyBold(
                        'Ход',
                        color: theme.colors.system.secondary,
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      height: UISize.base * 16,
                      child: BodyBold('Игроки', color: theme.colors.system.secondary),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      alignment: Alignment.center,
                      height: UISize.base * 16,
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
              for (var room in rooms) roomTableRow(room, theme),
            ],
          ),
        ),
      ),
    );
  }

  TableRow roomTableRow(
    RoomListItemModel room,
    AppThemeData theme,
  ) {
    return TableRow(
      children: [
        TableCell(
          child: Container(
            alignment: Alignment.center,
            height: UISize.base * 16,
            child: BodyRegular('${room.roomInfo.roomCode}'),
          ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.center,
            height: UISize.base * 16,
            child: BodyRegular('${room.roomInfo.moveTime} c'),
          ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.center,
            height: UISize.base * 16,
            child: BodyRegular('${room.playersCount}/${room.roomInfo.placesCount}'),
          ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.center,
            height: UISize.base * 16,
            child: TouchableOpacity(
              onPressed: () => onPressed(room.roomInfo),
              child: const AppIcons.start().copyWith(
                color: theme.colors.system.primary,
                size: UISize.base10x,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
