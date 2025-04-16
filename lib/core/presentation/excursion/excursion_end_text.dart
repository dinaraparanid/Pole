import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/excursion/excursion_place_controller.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class ExcursionEndText extends StatefulWidget {
  final ExcursionPlaceController? controller;
  final void Function(ExcursionPlaceController) onControllerAttached;

  const ExcursionEndText({
    super.key,
    this.controller,
    required this.onControllerAttached,
  });

  @override
  State<StatefulWidget> createState() => _ExcursionEndTextState();
}

final class _ExcursionEndTextState extends State<ExcursionEndText> {

  late final controller = widget.controller ?? ExcursionPlaceController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
      widget.onControllerAttached(controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Text(
      strings.excursion_end_of_tour,
      key: controller.key,
      style: theme.typography.body.copyWith(
        color: theme.colors.text.primary,
      ),
    );
  }
}
