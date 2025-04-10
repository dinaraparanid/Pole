import 'package:flutter/cupertino.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

final class PlaceSelectorContent extends StatelessWidget {
  final List<PlaceCategory> availableCategories;

  const PlaceSelectorContent({
    super.key,
    required this.availableCategories,
  });

  @override
  Widget build(BuildContext context) => Text('TODO: PlaceSelectorContent');
}
