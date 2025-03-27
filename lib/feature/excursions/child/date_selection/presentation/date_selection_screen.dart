import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/widget/city_picker.dart';

final class DateSelectionScreen extends StatelessWidget {
  final DateSelectionBloc bloc;

  const DateSelectionScreen({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    Widget CommonPadding({required Widget child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.large),
      child: child,
    );

    return BlocProvider(
      create: (_) => bloc,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonPadding(
              child: Text(
                strings.date_selection_title,
                textAlign: TextAlign.center,
                style: theme.typography.h.h3.copyWith(
                  color: theme.colors.text.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: theme.dimensions.padding.small),

            CommonPadding(
              child: Text(
                strings.date_selection_description,
                textAlign: TextAlign.center,
                style: theme.typography.body.copyWith(
                  color: theme.colors.text.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: theme.dimensions.padding.big),

            CommonPadding(child: CityPicker()),
          ],
        ),
      ),
    );
  }
}
