part of '../widgets.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    this.onChanged,
    this.onSubmitted,
    this.hintText = '',
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength = 100,
    Key? key,
  }) : super(key: key);

  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final mediaQuery = MediaQuery.of(context);

    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(UISize.base4x)),
      borderSide: BorderSide.none,
    );

    return SizedBox(
      height: _kButtonHeight,
      width: mediaQuery.size.width - UISize.base8x,
      child: Container(
        decoration: BoxDecoration(
          color: theme.colors.system.surface,
          borderRadius: const BorderRadius.all(Radius.circular(UISize.base4x)),
        ),
        padding: const EdgeInsets.only(left: UISize.base4x, right: UISize.base3x),
        child: Material(
          color: const Color(0x00000000),
          child: Padding(
            padding: const EdgeInsets.only(
              left: UISize.base2x,
              right: UISize.base4x,
            ),
            child: TextField(
              focusNode: FocusNode(descendantsAreFocusable: false),
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: theme.text.bodyRegular.copyWith(color: theme.colors.system.textOnColors),
                filled: true,
                fillColor: theme.colors.system.surface,
                focusColor: const Color(0x00000000),
                hoverColor: const Color(0x00000000),
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                errorBorder: border,
                disabledBorder: border,
                contentPadding: EdgeInsets.zero,
              ),
              minLines: 1,
              maxLines: maxLines,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              controller: controller,
              style: theme.text.bodyRegular.copyWith(color: theme.colors.system.textOnColors),
              onChanged: onChanged,
              cursorWidth: 2,
              onSubmitted: onSubmitted ?? (_) {},
              cursorColor: theme.colors.system.primary,
            ),
          ),
        ),
      ),
    );
  }
}
