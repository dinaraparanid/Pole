import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/app_text_frame.dart';
import 'package:pole/core/presentation/theme/mod.dart';

final class CityPicker extends StatelessWidget {
  const CityPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${strings.date_selection_city_label}:',
          style: theme.typography.body.copyWith(
            color: theme.colors.text.primary,
          ),
        ),

        SizedBox(height: theme.dimensions.padding.medium),

        AppTextFrame(
          isEnabled: false,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'г. Иннополис',
                  style: theme.typography.body.copyWith(
                    color: theme.colors.text.secondary,
                  ),
                ),
              ),

              SizedBox(width: theme.dimensions.padding.extraSmall),

              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: theme.dimensions.size.small,
                color: theme.colors.text.secondary,
              )
            ],
          ),
        ),

        SizedBox(height: theme.dimensions.padding.small),

        Text(
          strings.date_selection_city_warning,
          textAlign: TextAlign.center,
          style: theme.typography.regular.copyWith(
            color: theme.colors.text.secondary,
          ),
        ),
      ],
    );
  }
}
