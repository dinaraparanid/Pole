import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/widget/city_picker.dart';
import 'package:pole/feature/excursions/child/date_selection/presentation/widget/date_picker.dart';

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
      child: BlocBuilder<DateSelectionBloc, DateSelectionState>(
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: [
              CommonPadding(
                child: Text(
                  strings.date_selection_title,
                  textAlign: TextAlign.center,
                  style: theme.typography.h.h3.copyWith(
                    color: theme.colors.text.primary,
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
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.big),

              CommonPadding(
                child: CityPicker(
                  selectedCity: state.selectedCity,
                ),
              ),

              SizedBox(height: theme.dimensions.padding.medium),

              CommonPadding(
                child: DatePicker(
                  selectedDate: state.selectedDate,
                  onDatePicked: (date) => bloc.add(SelectDate(date: date)),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.large),

              CommonPadding(
                child: AppButton(
                  enabled: state.isContinueButtonEnabled,
                  onClick: () => bloc.add(ContinueClick()),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: theme.dimensions.padding.small,
                      horizontal: theme.dimensions.padding.large,
                    ),
                    child: Text(
                      strings.continue_txt,
                      style: theme.typography.h.h3.copyWith(
                        color: theme.colors.text.primary,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: theme.dimensions.padding.big),
            ],
          ),
        ),
      ),
    );
  }
}
