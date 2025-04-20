import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/excursion/excursion_places_controller.dart';
import 'package:pole/core/presentation/excursion/excursion_steps_painter.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/global_key.dart';

final _excursionStepsPainterKey = GlobalKey();

final class ExcursionSteps extends StatefulWidget {
  final ExcursionPlacesController controller;

  const ExcursionSteps({
    super.key,
    required this.controller,
  });

  @override
  State<StatefulWidget> createState() => _ExcursionStepsState();
}

final class _ExcursionStepsState extends State<ExcursionSteps> {

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onExcursionPlacesChanged);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(onExcursionPlacesChanged);
  }

  void onExcursionPlacesChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: ExcursionStepsPainter.calcStepRadius() * 2,
        minHeight: ExcursionStepsPainter.calcStepRadius() * 2,
      ),
      child: CustomPaint(
        key: _excursionStepsPainterKey,
        painter: ExcursionStepsPainter(
          theme: theme,
          positions: widget.controller.itemsGlobalYPositions.map(
            (itemY) => itemY - (_excursionStepsPainterKey.globalPosition?.dy ?? 0),
          ).toIList(),
        ),
      ),
    );
  }
}
