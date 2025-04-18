import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/general.dart';

final class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final int maxLines;
  final String? error;
  final Widget? suffix;
  final void Function(String)? onChanged;

  const AppTextField({
    super.key,
    this.controller,
    this.placeholder,
    this.maxLines = 1,
    this.error,
    this.suffix,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _AppTextFieldState();
}

final class _AppTextFieldState extends State<AppTextField> {

  late TextEditingController controller;

  final focusNode = FocusNode();
  var isFocused = false;

  bool get isError => widget.error != null;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.removeListener(onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void onFocusChange() => setState(() => isFocused = focusNode.hasFocus);

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return platformCall(
      android: MaterialUi,
      iOS: CupertinoUi,
      macOS: CupertinoUi,
    )(theme: theme);
  }

  TextStyle textStyle(AppTheme theme) =>
    theme.typography.h.h4.copyWith(color: theme.colors.text.primary);

  Color cursorColor(AppTheme theme) =>
    isError ? theme.colors.error : theme.colors.text.focused;

  Widget CupertinoUi({required AppTheme theme}) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CupertinoFormRow(
        padding: EdgeInsets.zero,
        error: widget.error
          ?.takeIf((e) => e.isNotEmpty)
          ?.let((error) => Text(
            error,
            style: theme.typography.regular.copyWith(
              color: theme.colors.error,
            ),
          )
        ),
        child: CupertinoTheme(
          data: CupertinoThemeData(
            primaryColor: theme.colors.text.focused,
          ),
          child: CupertinoTextField(
            controller: controller,
            focusNode: focusNode,
            suffix: widget.suffix,
            padding: EdgeInsets.zero,
            placeholder: widget.placeholder,
            placeholderStyle: theme.typography.h.h4.copyWith(
              color: theme.colors.text.disabled,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            style: textStyle(theme),
            cursorColor: cursorColor(theme),
            maxLines: widget.maxLines,
            onChanged: widget.onChanged,
          ),
        ),
      )
    ],
  );

  Widget MaterialUi({required AppTheme theme}) => TextField(
    controller: controller,
    focusNode: focusNode,
    style: textStyle(theme),
    cursorColor: cursorColor(theme),
    maxLines: widget.maxLines,
    decoration: InputDecoration(
      filled: false,
      errorText: widget.error,
      suffix: widget.suffix,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: theme.colors.text.focused,
          width: theme.dimensions.size.line.minimum
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: theme.colors.text.unfocused,
          width: theme.dimensions.size.line.minimum
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
        borderSide: BorderSide(
          color: theme.colors.error,
          width: theme.dimensions.size.line.minimum,
        ),
      ),
    ),
    onChanged: widget.onChanged,
  );
}
