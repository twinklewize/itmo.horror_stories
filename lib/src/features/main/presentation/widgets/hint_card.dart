import 'package:flutter/widgets.dart';

import '../../../../core/models/hint_card/hint_card.dart';

class HintCardWidget extends StatelessWidget {
  const HintCardWidget({super.key, required this.hintCard});
  final HintCardModel hintCard;

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Placeholder(),
      ),
    );
  }
}

// RotatedBox(
//                   quarterTurns: -1,
//                   child: HintCardWidget(cardName: cards[3]),
//                 ),
