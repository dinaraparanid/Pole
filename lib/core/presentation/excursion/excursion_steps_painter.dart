import 'package:dartx/dartx.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/rendering.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/app.dart';
import 'package:pole/core/utils/funtions/do_nothing.dart';

final class ExcursionStepsPainter extends CustomPainter {
  static const _radiusMobile = 16.0;
  static const _radiusDesktop = 24.0;

  static const _bridgeHalfWidth = 2.0;
  static const _bridgeWidth = _bridgeHalfWidth * 2;

  final AppTheme theme;
  final IList<double> positions;
  ExcursionStepsPainter({required this.theme, required this.positions});

  @override
  void paint(Canvas canvas, Size size) {
    final commonPaint = Paint()
      ..strokeWidth = theme.dimensions.size.line.medium
      ..style = PaintingStyle.fill;

    final stepPaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionPlacesStep;

    final bridgePaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionPlacesBridge;

    final stepRadius = calcStepRadius();
    final stepDiameter = stepRadius * 2;
    final bridgeLeft = stepRadius - _bridgeHalfWidth;

    void drawStepsConnection({required double top1, required double top2}) {
      final step1OvalPosition = Rect.fromLTWH(
        0,
        top1,
        stepDiameter,
        stepDiameter,
      );

      final step1Center = step1OvalPosition.center;

      final step2OvalPosition = Rect.fromLTWH(
        0,
        top2,
        stepDiameter,
        stepDiameter,
      );

      final step2Center = step2OvalPosition.center;

      final step12BridgeHeight = step2Center.dy - step1Center.dy - stepDiameter;

      final step12BridgeRect = Rect.fromLTWH(
        bridgeLeft,
        step1Center.dy + stepRadius,
        _bridgeWidth,
        step12BridgeHeight,
      );

      canvas.drawOval(step1OvalPosition, stepPaint);
      canvas.drawRect(step12BridgeRect, bridgePaint);
    }

    void drawLastStepsConnection({required double top1, required double center2}) {
      final step1OvalPosition = Rect.fromLTWH(
        0,
        top1,
        stepDiameter,
        stepDiameter,
      );

      final step1Center = step1OvalPosition.center;

      final step2OvalPosition = Rect.fromLTWH(
        0,
        center2 - stepRadius,
        stepDiameter,
        stepDiameter,
      );

      final step2Center = step2OvalPosition.center;

      final step12BridgeHeight = step2Center.dy - step1Center.dy - stepDiameter;

      final step12BridgeRect = Rect.fromLTWH(
        bridgeLeft,
        step1Center.dy + stepRadius,
        _bridgeWidth,
        step12BridgeHeight,
      );

      canvas.drawOval(step1OvalPosition, stepPaint);
      canvas.drawRect(step12BridgeRect, bridgePaint);
    }

    void drawLastPoint({required double center}) {
      final stepOvalPosition = Rect.fromLTWH(
        0,
        center - stepRadius,
        stepDiameter,
        stepDiameter,
      );

      canvas.drawOval(stepOvalPosition, stepPaint);
    }

    positions.windowed(3, partialWindows: true).forEach((points) =>
      switch ((points.getOrNull(0), points.getOrNull(1), points.getOrNull(2))) {
        (double center, null, null) =>
          drawLastPoint(center: center),

        (double top1, double center2, null) =>
          drawLastStepsConnection(top1: top1, center2: center2),

        (double top1, double top2, _) =>
          drawStepsConnection(top1: top1, top2: top2),

        _ => doNothing()
      }
    );
  }

  @override
  bool shouldRepaint(covariant ExcursionStepsPainter oldDelegate) {
    if (oldDelegate.positions != positions) return true;
    if (oldDelegate.theme != theme) return true;
    return false;
  }

  static double calcStepRadius() => platformCall(
    android: _radiusMobile,
    iOS: _radiusMobile,
    macOS: _radiusDesktop,
  );
}
