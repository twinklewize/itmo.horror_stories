import 'package:flutter/widgets.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/ui_kit/ui_kit.dart';

class PlayersWidget extends StatelessWidget {
  const PlayersWidget({
    required this.placesCount,
    required this.players,
    super.key,
  });
  final List<PlayerModel> players;
  final int placesCount;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UISize.base4x),
        border: Border.all(color: theme.colors.system.surface),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: UISize.base2x,
          mainAxisSpacing: UISize.base2x,
          childAspectRatio: 2,
        ),
        itemCount: placesCount,
        itemBuilder: (BuildContext context, int index) {
          if (index >= players.length) {
            return Center(child: BodyBold('Пусто', color: theme.colors.system.text20));
          }
          final nickname = players[index].nickname;
          if (players[index].isMaster) {
            return Center(child: BodyBold(nickname, color: theme.colors.system.primary));
          }
          if (players[index].isPlayer) {
            return Center(child: BodyBold(nickname));
          }
          return Center(child: BodyBold(nickname, color: theme.colors.system.text40));
        },
      ),
    );
  }
}
