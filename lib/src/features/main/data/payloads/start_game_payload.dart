import 'package:horror_stories/src/core/models/models.dart';

class StartGamePayload {
  final List<HintCardModel> hintCards;
  final Id selectedCardId;
  final List<TableCardModel> tableCards;

  StartGamePayload({
    required this.hintCards,
    required this.selectedCardId,
    required this.tableCards,
  });
}
