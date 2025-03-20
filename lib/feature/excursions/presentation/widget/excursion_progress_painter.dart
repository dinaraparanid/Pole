import 'package:dartx/dartx.dart';
import 'package:flutter/rendering.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/app.dart';
import 'package:pole/l10n/app_localizations.dart';

const _radiusMobile = 16.0;
const _radiusDesktop = 24.0;

const _stepTextPadding = 8.0;

const _bridgeHalfHeight = 2.0;
const _bridgeHeight = _bridgeHalfHeight * 2;

final class ExcursionProgressPainter extends CustomPainter {
  final double progress;
  final AppTheme theme;
  final AppLocalizations strings;

  ExcursionProgressPainter({
    required this.progress,
    required this.theme,
    required this.strings,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final commonPaint = Paint()
      ..strokeWidth = theme.dimensions.size.line.medium
      ..style = PaintingStyle.fill;

    final progressPaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionProgressPassed;

    final backgroundPaint = Paint
      .from(commonPaint)
      ..color = theme.colors.uniqueComponents.excursionProgressLeft;

    final stepRadius = calcStepRadius();
    final stepDiameter = stepRadius * 2;
    final bridgeTop = stepRadius - _bridgeHalfHeight;

    final textStartY = stepDiameter + _stepTextPadding;

    // ------------- Texts -------------

    final step1TextPainter = TextPainter(
      text: TextSpan(
        text: strings.excursions_step1,
        style: theme.typography.caption.copyWith(
          color: theme.colors.primary,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    final step2TextPainter = TextPainter(
      text: TextSpan(
        text: strings.excursions_step2,
        style: theme.typography.caption.copyWith(
          color: progress >= 0.5 ? theme.colors.primary : theme.colors.text.disabled,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    final step3TextPainter = TextPainter(
      text: TextSpan(
        text: strings.excursions_step3,
        style: theme.typography.caption.copyWith(
          color: progress >= 1 ? theme.colors.primary : theme.colors.text.disabled,
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
    backgroundPath.addOval(Rect.fromLTWH(step1TextOffset.dx + step1TextPainter.width / 2 - stepRadius, 0, stepDiameter, stepDiameter));

    final step12BridgeWidth = step2Center.dx - step1Center.dx - stepDiameter;
    final step12BridgeRect = Rect.fromLTWH(
      step1Center.dx + stepRadius,
      bridgeTop,
      step12BridgeWidth,
      _bridgeHeight,
    );

    backgroundPath.addRect(step12BridgeRect);

    // ------------- Step 2 -------------

    backgroundPath.addOval(Rect.fromLTWH(step2TextOffset.dx + step2TextPainter.width / 2 - stepRadius, 0, stepDiameter, stepDiameter));

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

    backgroundPath.addOval(Rect.fromLTWH(step3TextOffset.dx + step3TextPainter.width / 2 - stepRadius, 0, stepDiameter, stepDiameter));
    canvas.drawPath(backgroundPath, backgroundPaint);

    // ------------- Progress -------------
    // 0.2 = 100% for a shape
    // (0.0;0.2)-0.2;0.4-(0.4;0.6)-0.6;0.8-(0.8;1.0)

    final step1Fill = progress.coerceIn(0, 0.2) / 0.2;
    final step1Width = stepDiameter * step1Fill;
    final bridge12Fill = (progress - 0.2).coerceIn(0, 0.2) / 0.2;
    final bridge12Width = step12BridgeWidth * bridge12Fill;
    final step2Fill = (progress - 0.4).coerceIn(0, 0.2) / 0.2;
    final step2Width = stepDiameter * step2Fill;
    final bridge23Fill = (progress - 0.6).coerceIn(0, 0.2) / 0.2;
    final bridge23Width = step23BridgeWidth * bridge23Fill;
    final step3Fill = (progress - 0.8).coerceIn(0, 0.2) / 0.2;
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

  @override
  bool shouldRepaint(covariant ExcursionProgressPainter oldDelegate) {
    if (oldDelegate.progress != progress) return true;
    if (oldDelegate.theme != theme) return true;
    if (oldDelegate.strings != strings) return true;
    return false;
  }

  double calcStepRadius() => platformCall(
    android: _radiusMobile,
    iOS: _radiusMobile,
    macOS: _radiusDesktop,
  );
}
