import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/adaptive_date_picker.dart';
import 'package:pole/core/presentation/foundation/text/app_text_frame.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/date_time.dart';

final class DatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime) onDatePicked;

  const DatePicker({
    super.key,
    required this.selectedDate,
    required this.onDatePicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${strings.date_selection_date_time_label}:',
          style: theme.typography.body.copyWith(
            color: theme.colors.text.primary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        AppTextFrame(
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.loadSvg('ic_calendar').value,
                width: theme.dimensions.size.small,
                height: theme.dimensions.size.small,
              ),

              SizedBox(width: theme.dimensions.padding.medium),

              Expanded(
                child: InkWell(
                  onTap: () => showAdaptiveDatePicker(
                    context: context,
                    selectedDateTime: selectedDate,
                    onDatePicked: onDatePicked,
                  ),
                  child: Text(
                    selectedDate
                      ?.toAppDateFormat()
                      ?? strings.date_selection_date_time_placeholder,
                    style: theme.typography.body.copyWith(
                      color: theme.colors.text.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
