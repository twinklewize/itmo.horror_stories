import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

class RoomTitleWidget extends StatelessWidget {
  const RoomTitleWidget({
    super.key,
    required this.roomCode,
  });
  final int roomCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Title2('Комната'),
        Title2('№ $roomCode'),
      ],
    );
  }
}
