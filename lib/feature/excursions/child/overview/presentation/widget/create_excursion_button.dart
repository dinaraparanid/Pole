import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class CreateExcursionButton extends StatelessWidget {
  final void Function() onClick;
  const CreateExcursionButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return AppButton(
      text: strings.overview_create_excursion,
      onClick: onClick,
    );
  }
}
