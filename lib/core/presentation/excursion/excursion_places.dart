import 'package:flutter/cupertino.dart';
import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/core/presentation/excursion/visitation_node.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class ExcursionPlaces extends StatelessWidget {
  final Excursion excursion;
  const ExcursionPlaces({super.key, required this.excursion});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: theme.dimensions.padding.medium,
      children: [
        ...excursion.visitations.map((v) => VisitationNode(visitation: v)),

        Text(
          strings.excursion_end_of_tour,
          style: theme.typography.body.copyWith(
            color: theme.colors.text.primary,
          ),
        ),
      ],
    );
  }
}
