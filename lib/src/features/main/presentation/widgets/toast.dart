import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

class Toast extends StatelessWidget {
  const Toast({
    required this.text,
    this.isDark = true,
    super.key,
  });
  final String text;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UISize.base4x),
          color: isDark ? theme.colors.system.surfaceDark : theme.colors.system.surface,
        ),
        padding: const EdgeInsets.all(UISize.base12x),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BodyBold(
              text,
              color: isDark ? theme.colors.system.text : theme.colors.system.textOnColors,
              maxLines: 5,
              textAlign: TextAlign.center,
            ),
            UIBox.base4x,
            const PrimaryButton(
              onPressed: BotToast.cleanAll,
              text: 'Закрыть',
            )
          ],
        ),
      ),
    );
  }
}
