part of '../widgets.dart';

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    required this.text1,
    required this.onPressed1,
    required this.text2,
    required this.onPressed2,
    super.key,
  });
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SecondaryButton(onPressed: onPressed1, text: text1)),
        UIBox.base12x,
        Expanded(child: PrimaryButton(onPressed: onPressed2, text: text2)),
      ],
    );
  }
}
