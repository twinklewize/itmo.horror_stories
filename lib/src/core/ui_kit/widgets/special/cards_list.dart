part of '../widgets.dart';

const _kCardsPadding = UISize.base8x;
const _kCardSizeRatio = 0.5;

const _cards = [
  'Банши',
  'Безумный ученый',
  'Болотное чудовище',
  'Бугимен',
  'Вампир',
  'Всадник без головы',
  'Гаргулья',
  'Гремлин',
  'Маньяк',
  'Йети',
  'Ктулху',
  'Мумия',
  'Оборотень',
  'Злой клоун',
  'Зомби',
  'Мрачный жнец',
];

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        width: width / 2,
        alignment: Alignment.center,
        child: SizedBox(
          width: 2 * _kCardSizeRatio * _kCardWidth + _kCardsPadding,
          child: Stack(
            children: [
              Positioned(
                top: -_kCardSizeRatio * _kCardHeight,
                child: Row(
                  children: [
                    SizedBox(
                      width: _kCardSizeRatio * _kCardWidth,
                      child: Column(
                        children: [
                          for (var i = 0; i < _cards.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom: _kCardsPadding),
                              child: DefaultCard(cardName: _cards[i]),
                            ),
                        ],
                      ),
                    ),
                    UIBox.base8x,
                    SizedBox(
                      width: _kCardSizeRatio * _kCardWidth,
                      child: Column(
                        children: [
                          const SizedBox(height: _kCardSizeRatio * _kCardHeight),
                          for (var i = _cards.length - 1; i >= 0; i--)
                            Padding(
                              padding: const EdgeInsets.only(bottom: _kCardsPadding),
                              child: DefaultCard(cardName: _cards[i]),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
