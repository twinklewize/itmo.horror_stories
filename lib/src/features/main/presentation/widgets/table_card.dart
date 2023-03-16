import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';

class TableCardWidget extends StatelessWidget {
  const TableCardWidget({super.key, required this.tableCard});
  final TableCardModel tableCard;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: FittedBox(child: Placeholder()),
    );
  }
}
