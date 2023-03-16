import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/hint_card/hint_card.dart';

import 'hint_card.dart';

class HintCardsWidget extends StatelessWidget {
  const HintCardsWidget({
    required this.hintCards,
    super.key,
  });
  final List<HintCardModel> hintCards;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return SizedBox(
        width: mediaQuery.size.width * 0.2,
        height: mediaQuery.size.height * 0.8,
        child: FittedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: hintCards.map((hintCard) => HintCardWidget(hintCard: hintCard)).toList(),
          ),
        ));
  }
}
