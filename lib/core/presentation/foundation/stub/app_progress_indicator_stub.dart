import 'package:flutter/cupertino.dart';
import 'package:pole/core/presentation/foundation/app_progress_indicator.dart';

final class AppProgressIndicatorStub extends StatelessWidget {
  const AppProgressIndicatorStub({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.center,
    children: [AppProgressIndicator()],
  );
}
