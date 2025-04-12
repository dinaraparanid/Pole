import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/foundation/stub/app_stub.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class AppEmptyStub extends StatelessWidget {
  final void Function() retry;
  const AppEmptyStub({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return AppStub(
      description: strings.not_found,
      applyButtonText: strings.try_again,
      apply: retry,
    );
  }
}
