import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/app.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';
import 'package:pole/l10n/app_localizations.dart';

const _radiusMobile = 16.0;
const _radiusDesktop = 24.0;

const _stepTextPadding = 8.0;

const _bridgeHalfHeight = 2.0;
const _bridgeHeight = _bridgeHalfHeight * 2;

final class ExcursionProgressPainter extends CustomPainter {
  final double progress;
  final PictureInfo? icCheck;
  final AppTheme theme;
  final AppLocalizations strings;

  ExcursionProgressPainter({
    required this.progress,
    required this.icCheck,
    required this.theme,
    required this.strings,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final commonPaint = Paint()
      ..strokeWidth = theme.dimensions.size.line.medium
      ..style = PaintingStyle.fill;

    final progressActivePaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionProgressActive;

    final progressPassedPaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionProgressPassed;

    final backgroundPaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionProgressLeft;

    final stepRadius = _calcStepRadius();
    final stepDiameter = stepRadius * 2;
    final bridgeTop = stepRadius - _bridgeHalfHeight;

    final textStartY = stepDiameter + _stepTextPadding;

    // ------------- Texts -------------

    final step1TextPainter = TextPainter(
      text: TextSpan(
        text: strings.excursions_step1,
        style: theme.typography.caption.copyWith(
          color: _calcText1Color(),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    final step2TextPainter = TextPainter(
      text: TextSpan(
        text: strings.excursions_step2,
        style: theme.typography.caption.copyWith(
          color: _calcText2Color(),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    final step3TextPainter = TextPainter(
      text: TextSpan(
        text: strings.excursions_step3,
        style: theme.typography.caption.copyWith(
          color: _calcText3Color(),
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    step1TextPainter.layout();
    step2TextPainter.layout();
    step3TextPainter.layout();

    final textFreeSpace = size.width - step1TextPainter.width - step2TextPainter.width - step3TextPainter.width;
    final textSpaceBetween = textFreeSpace / 2;

    final step1TextOffset = Offset(0, textStartY);
    step1TextPainter.paint(canvas, step1TextOffset);

    final step2TextOffset = Offset(step1TextPainter.width + textSpaceBetween, textStartY);
    step2TextPainter.paint(canvas, step2TextOffset);

    final step3TextOffset = Offset(step1TextPainter.width + textSpaceBetween + step2TextPainter.width + textSpaceBetween, textStartY);
    step3TextPainter.paint(canvas, step3TextOffset);

    final step1Center = Offset(step1TextOffset.dx + step1TextPainter.width / 2, stepRadius);
    final step2Center = Offset(step2TextOffset.dx + step2TextPainter.width / 2, stepRadius);
    final step3Center = Offset(step3TextOffset.dx + step3TextPainter.width / 2, stepRadius);

    // ------------- Step 1 -------------

    final backgroundPath = Path();

    final step1OvalPosition = Rect.fromLTWH(
      step1TextOffset.dx + step1TextPainter.width / 2 - stepRadius,
      0,
      stepDiameter,
      stepDiameter,
    );

    backgroundPath.addOval(step1OvalPosition);

    final step12BridgeWidth = step2Center.dx - step1Center.dx - stepDiameter;

    final step12BridgeRect = Rect.fromLTWH(
      step1Center.dx + stepRadius,
      bridgeTop,
      step12BridgeWidth,
      _bridgeHeight,
    );

    backgroundPath.addRect(step12BridgeRect);

    // ------------- Step 2 -------------

    final step2OvalPosition = Rect.fromLTWH(
      step2TextOffset.dx + step2TextPainter.width / 2 - stepRadius,
      0,
      stepDiameter,
      stepDiameter,
    );

    backgroundPath.addOval(step2OvalPosition);

    final step23BridgeWidth = step3Center.dx - step2Center.dx - stepDiameter;

    final step23BridgeRect = Rect.fromLTWH(
      step2Center.dx + stepRadius,
      bridgeTop,
      step23BridgeWidth,
      _bridgeHeight,
    );

    backgroundPath.addRect(step23BridgeRect);
    canvas.drawRect(step23BridgeRect, backgroundPaint);

    // ------------- Step 3 -------------

    final step3OvalPosition = Rect.fromLTWH(
      step3TextOffset.dx + step3TextPainter.width / 2 - stepRadius,
      0,
      stepDiameter,
      stepDiameter,
    );

    backgroundPath.addOval(step3OvalPosition);
    canvas.drawPath(backgroundPath, backgroundPaint);

    // ------------- Progress -------------
    // 0.2 = 100% for a shape
    // (0.0;0.2)-0.2;0.4-(0.4;0.6)-0.6;0.8-(0.8;1.0)

    void drawProgress({
      required double progressRatio,
      required Paint progressPaint,
    }) {
      final step1Fill = progressRatio.coerceIn(0, 0.2) / 0.2;
      final step1Width = stepDiameter * step1Fill;
      final bridge12Fill = (progressRatio - 0.2).coerceIn(0, 0.2) / 0.2;
      final bridge12Width = step12BridgeWidth * bridge12Fill;
      final step2Fill = (progressRatio - 0.4).coerceIn(0, 0.2) / 0.2;
      final step2Width = stepDiameter * step2Fill;
      final bridge23Fill = (progressRatio - 0.6).coerceIn(0, 0.2) / 0.2;
      final bridge23Width = step23BridgeWidth * bridge23Fill;
      final step3Fill = (progressRatio - 0.8).coerceIn(0, 0.2) / 0.2;
      final step3Width = stepDiameter * step3Fill;
      final progressWidth = step1Width + bridge12Width + step2Width + bridge23Width + step3Width;

      final progressPath = Path.combine(
        PathOperation.intersect,
        backgroundPath,
        Path()..addRect(
          Rect.fromLTWH(
            step1TextOffset.dx + step1TextPainter.width / 2 - stepRadius,
            0,
            progressWidth,
            size.height,
          ),
        ),
      );

      canvas.drawPath(progressPath, progressPaint);
    }

    drawProgress(
      progressRatio: progress,
      progressPaint: progressActivePaint,
    );

    drawProgress(
      progressRatio: _calcPassedProgress(),
      progressPaint: progressPassedPaint,
    );

    icCheck?.let((svg) {
      if (progress > ExcursionsState.dateSelectionProgress) {
        final dx = step1Center.dx - svg.size.width / 2;
        final dy = step1Center.dy - svg.size.height / 2;
        canvas.translate(dx, dy);
        canvas.drawPicture(svg.picture);
      }

      if (progress > ExcursionsState.planningProgress) {
        final dx = step2Center.dx - step1Center.dx;
        final dy = step2Center.dy - step1Center.dy;
        canvas.translate(dx, dy);
        canvas.drawPicture(svg.picture);
      }

      if (progress >= ExcursionsState.overviewProgress) {
        final dx = step3Center.dx - step2Center.dx;
        final dy = step3Center.dy - step2Center.dy;
        canvas.translate(dx, dy);
        canvas.drawPicture(svg.picture);
      }
    });
  }

  @override
  bool shouldRepaint(covariant ExcursionProgressPainter oldDelegate) {
    if (oldDelegate.progress != progress) return true;
    if (oldDelegate.theme != theme) return true;
    if (oldDelegate.strings != strings) return true;
    return false;
  }

  double _calcStepRadius() => platformCall(
    android: _radiusMobile,
    iOS: _radiusMobile,
    macOS: _radiusDesktop,
  );

  double _calcPassedProgress() {
    if (progress <= ExcursionsState.dateSelectionProgress) {
      return 0;
    }

    if (progress <= ExcursionsState.planningProgress) {
      return (progress - 0.2).coerceAtLeast(
        ExcursionsState.dateSelectionProgress,
      );
    }

    if (progress <= ExcursionsState.overviewProgress) {
      return (progress - 0.2).coerceAtLeast(
        ExcursionsState.planningProgress,
      );
    }

    return ExcursionsState.overviewProgress;
  }

  Color _calcText1Color() => progress > 0.2
    ? theme.colors.uniqueComponents.excursionProgressPassed
    : theme.colors.uniqueComponents.excursionProgressActive;

  Color _calcText2Color() {
    if (progress < 0.5) {
      return theme.colors.text.disabled;
    }

    if (progress > 0.6) {
      return theme.colors.uniqueComponents.excursionProgressPassed;
    }

    return theme.colors.uniqueComponents.excursionProgressActive;
  }

  Color _calcText3Color() => progress < 1
    ? theme.colors.text.disabled
    : theme.colors.uniqueComponents.excursionProgressActive;
}
