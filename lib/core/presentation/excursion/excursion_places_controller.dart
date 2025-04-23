import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:pole/core/presentation/excursion/excursion_place_controller.dart';
import 'package:pole/core/domain/excursion/entity/visitation.dart';

final class ExcursionPlacesController with ChangeNotifier {
  var _itemControllers = IMap<Visitation?, ExcursionPlaceController>();

  IMap<Visitation?, ExcursionPlaceController> get itemControllers =>
    _itemControllers;

  IList<double> get itemsGlobalYPositions => IList(
    _itemControllers.entries.mapNotNull((entry) =>
      switch (entry?.key) {
        null => entry?.value.widgetGlobalCenterHeight,
        _ => entry?.value.widgetGlobalPosition?.dy,
      },
    )
  );

  void addExcursionPlaceController({
    Visitation? visitation,
    required ExcursionPlaceController controller,
  }) {
    _itemControllers = _itemControllers.add(visitation, controller);
    notifyListeners();
  }

  @override
  void dispose() {
    _itemControllers = _itemControllers.clear();
    super.dispose();
  }
}
