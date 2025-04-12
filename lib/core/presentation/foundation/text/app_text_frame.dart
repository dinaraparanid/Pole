import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/theme/mod.dart';

const _selectorMaxWidth = 482.0;
const _opacityEnabled = 1.0;
const _opacityDisabled = 0.25;
const _opacityDuration = Duration(minutes: 500);

final class AppTextFrame extends StatelessWidget {
  final bool isEnabled;
  final Widget child;

  const AppTextFrame({
    super.key,
    this.isEnabled = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return AnimatedOpacity(
      opacity: isEnabled ? _opacityEnabled : _opacityDisabled,
      duration: _opacityDuration,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: _selectorMaxWidth),
        padding: EdgeInsets.symmetric(
          vertical: theme.dimensions.padding.extraMedium,
          horizontal: theme.dimensions.padding.extraBig,
        ),
        decoration: BoxDecoration(
          color: theme.colors.text.background,
          borderRadius: BorderRadius.circular(theme.dimensions.radius.small),
          border: Border.all(
            color: theme.colors.text.unfocused,
            width: theme.dimensions.size.line.small,
          ),
        ),
        child: child,
      ),
    );
  }
}
