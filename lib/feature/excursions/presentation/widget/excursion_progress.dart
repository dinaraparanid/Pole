import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/presentation/widget/excursion_progress_painter.dart';

const _progressMinHeight = 64.0;

final class ExcursionProgress extends StatelessWidget {
  const ExcursionProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;
    final size = MediaQuery.of(context).size;

    return BlocBuilder<ExcursionsBloc, ExcursionsState>(
      builder: (context, state) => CustomPaint(
        size: Size(size.width, _progressMinHeight),
        painter: ExcursionProgressPainter(
          progress: state.progress,
          theme: theme,
          strings: strings,
        ),
      ),
    );
  }
}
