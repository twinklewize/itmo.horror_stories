import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

class PlayersWidget extends StatelessWidget {
  const PlayersWidget({
    required this.playersInfo,
    super.key,
  });
  final PlayersInfoModel playersInfo;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(UISize.base2x),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Column(
                children: [
                  BodyBold('player'),
                  UIBox.base2x,
                  BodyBold('player'),
                  UIBox.base2x,
                  BodyBold('player'),
                  UIBox.base2x,
                  BodyBold('player'),
                  UIBox.base2x,
                  BodyBold('player'),
                ],
              ),
              UIBox.base8x,
              Column(
                children: [
                  const BodyBold('player'),
                  UIBox.base2x,
                  BodyBold(
                    'пусто',
                    color: theme.colors.system.text20,
                  ),
                  UIBox.base2x,
                  BodyBold(
                    'пусто',
                    color: theme.colors.system.text20,
                  ),
                  UIBox.base2x,
                  BodyBold(
                    'пусто',
                    color: theme.colors.system.text20,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
