import 'package:flutter/cupertino.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/core/presentation/excursion/excursion_end_text.dart';
import 'package:pole/core/presentation/excursion/excursion_places_controller.dart';
import 'package:pole/core/presentation/excursion/excursion_steps.dart';
import 'package:pole/core/presentation/excursion/visitation_node.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class ExcursionPlaces extends StatefulWidget {
  final Excursion excursion;
  final ExcursionPlacesController? controller;

  const ExcursionPlaces({
    super.key,
    required this.excursion,
    this.controller,
  });

  @override
  State<StatefulWidget> createState() => _ExcursionPlacesState();
}

final class _ExcursionPlacesState extends State<ExcursionPlaces> {

  late final ExcursionPlacesController controller =
    widget.controller ?? ExcursionPlacesController();

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Row(
      children: [
        ExcursionSteps(controller: controller),

        SizedBox(width: theme.dimensions.padding.extraMedium),

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: theme.dimensions.padding.medium,
            children: [
              ...widget.excursion.visitations.map((v) => VisitationNode(
                visitation: v,
                onControllerAttached: (itemController) =>
                  controller.addExcursionPlaceController(
                    visitation: v,
                    controller: itemController,
                  ),
                ),
              ),

              ExcursionEndText(
                onControllerAttached: (itemController) =>
                  controller.addExcursionPlaceController(
                    controller: itemController,
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
