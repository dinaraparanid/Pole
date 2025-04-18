import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/city/entity/city.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/excursion_name_field.dart';
import 'package:pole/feature/excursions/child/planning/child/place_selector/presentation/place_selector_bottom_sheet.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/planning_confirm_button.dart';
import 'package:pole/feature/excursions/child/planning/presentation/widget/timetable/excursions_timetable.dart';

final class PlanningScreen extends StatelessWidget {
  final PlanningBlocFactory blocFactory;
  final City city;
  final DateTime date;

  const PlanningScreen({
    super.key,
    required this.blocFactory,
    required this.city,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    Widget CommonPadding({required Widget child}) => Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.dimensions.padding.large),
      child: child,
    );

    return BlocProvider(
      create: (_) => blocFactory.create(city: city, date: date)..add(
        OnCreate(initialName: strings.planning_title_placeholder),
      ),
      child: BlocPresentationListener<PlanningBloc, PlanningEffect>(
        listener: (context, effect) => switch (effect) {
          ShowPlaceSelectorBottomSheet() =>
            showPlaceSelectorBottomSheet(context: context, bloc: effect.bloc),

          HidePlaceSelectorBottomSheet() =>
            Navigator.of(context, rootNavigator: true).pop(),
        },
        child: BlocBuilder<PlanningBloc, PlanningState>(
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              children: [
                CommonPadding(
                  child: ExcursionNameField(
                    initialText: state.excursionName.value
                      .takeIf((s) => s.isNotBlank)
                      ?? strings.planning_title_placeholder,
                    placeholder: strings.planning_title_placeholder,
                    onExcursionNameChanged: (name) => BlocProvider
                      .of<PlanningBloc>(context)
                      .add(ChangeExcursionName(name: name)),
                  ),
                ),

                SizedBox(height: theme.dimensions.padding.small),

                CommonPadding(
                  child: Text(
                    strings.planning_description,
                    style: theme.typography.body.copyWith(
                      color: theme.colors.text.secondary,
                    ),
                  ),
                ),

                SizedBox(height: theme.dimensions.padding.large),

                CommonPadding(child: ExcursionsTimetable()),

                SizedBox(height: theme.dimensions.padding.large),

                CommonPadding(child: PlanningConfirmButton()),

                SizedBox(height: theme.dimensions.padding.large),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
