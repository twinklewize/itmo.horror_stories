part of '../widgets.dart';

const _kDefaultWidth = 800.0;

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: UISize.base8x,
          horizontal: UISize.base4x,
        ),
        child: SizedBox(
          width: _kDefaultWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
