import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/funtions/distinct_state.dart';
import 'package:pole/feature/excursions/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/presentation/widget/excursion_progress_painter.dart';

const _progressMinHeight = 64.0;

final class ExcursionProgress extends StatefulWidget {
  final double? initialProgress;

  const ExcursionProgress({
    super.key,
    this.initialProgress,
  });

  @override
  State<StatefulWidget> createState() => _ExcursionProgressState();
}

final class _ExcursionProgressState extends State<ExcursionProgress>
  with SingleTickerProviderStateMixin {

  static const _animationDuration = Duration(milliseconds: 500);

  late AnimationController _progressController;
  late Tween<double> _progressTween;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _progressController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      lowerBound: 0,
      upperBound: ExcursionsState.creationFinishProgress,
    );

    _progressController.value = widget.initialProgress
      ?? ExcursionsState.dateSelectionProgress;

    _progressTween = Tween(
      begin: 0,
      end: ExcursionsState.creationFinishProgress,
    );

    _progressAnimation = _progressTween.animate(_progressController);
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ExcursionsCubit, ExcursionsState>(
      listenWhen: distinctState((x) => x.step),
      listener: (_, state) => _progressController.animateTo(
        state.progress,
        duration: _animationDuration,
      ),
      builder: (context, state) => AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, _) => FutureBuilder(
          future: vg.loadPicture(
            SvgAssetLoader(AppImages.loadSvg('ic_check').value), null
          ),
          builder: (context, icCheck) => CustomPaint(
            size: Size(size.width, _progressMinHeight),
            painter: ExcursionProgressPainter(
              progress: _progressAnimation.value / ExcursionsState.creationFinishProgress,
              icCheck: icCheck.data,
              theme: theme,
              strings: strings,
            ),
          ),
        ),
      ),
    );
  }
}
