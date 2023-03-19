import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';

import 'table_card.dart';

class TableCardsWidget extends StatelessWidget {
  const TableCardsWidget({
    required this.tableCardsInfo,
    required this.onPressed,
    super.key,
  });
  final TableCardsInfoModel tableCardsInfo;
  final Function(Id tableCardId) onPressed;

  @override
  Widget build(BuildContext context) {
    final tableCards = tableCardsInfo.tableCards;
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
        width: mediaQuery.size.width * 0.5,
        height: mediaQuery.size.height * 0.8,
        child: FittedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < 3; i++)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var j = 0; j < 4; j++)
                      TableCardWidget(
                        tableCard: tableCards[4 * i + j],
                        onPressed: onPressed,
                      ),
                  ],
                ),
            ],
          ),
        ));
  }
}
