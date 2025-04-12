import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/foundation/stub/app_stub.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppEmptyFiltersStub extends StatelessWidget {
  final void Function() resetFilters;
  const AppEmptyFiltersStub({super.key, required this.resetFilters});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return AppStub(
      description: strings.not_found_filters,
      applyButtonText: strings.reset_filters,
      apply: resetFilters,
    );
  }
}
