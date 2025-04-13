import 'package:pole/core/domain/excursion/excursion.dart';
import 'package:pole/feature/excursions/child/overview/presentation/bloc/overview_bloc.dart';

final class OverviewBlocFactory {
  OverviewBloc create({
    required Excursion excursion,
    required void Function() onResult,
  }) => OverviewBloc(
    excursion: excursion,
    onResult: onResult,
  );
}
