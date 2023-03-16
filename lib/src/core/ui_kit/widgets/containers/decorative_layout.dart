part of '../widgets.dart';

const _kMaxWidth = 1000.0;
const _kColumnWidth = 460.0;

class DecorativeLayout extends StatelessWidget {
  const DecorativeLayout({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final withCards = width > _kMaxWidth;

    return ScreenContainer(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: withCards ? width / 2 : width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                vertical: UISize.base8x,
                horizontal: UISize.base4x,
              ),
              child: SizedBox(
                width: _kColumnWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              ),
            ),
            if (withCards) const CardList(),
          ],
        ),
      ),
    );
  }
}
