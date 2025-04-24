import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/excursion/repository/excursion_repository.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/stub/app_progress_indicator_stub.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/di/app_module.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/mod.dart';
import 'package:pole/feature/profile/child/tours/presentation/widget/tours_content.dart';
import 'package:pole/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:pole/feature/profile/presentation/bloc/profile_state.dart';
import 'package:pole/feature/profile/presentation/bloc/tour_filter.dart';

final class ToursScreen extends StatelessWidget {
  final ToursBlocFactory blocFactory;

  const ToursScreen({
    super.key,
    required this.blocFactory,
  });

  @override
  Widget build(BuildContext context) =>
    BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) => BlocProvider(
        key: ValueKey(state.filter),
        create: (_) => switch (state.filter) {
          TourFilter.favourites => blocFactory(
            tourProducer: di<ExcursionRepository>().findFavouriteExcursions
          ),

          TourFilter.archive => blocFactory(
            tourProducer: di<ExcursionRepository>().findArchiveExcursions
          ),
        },
        child: BlocBuilder<ToursBloc, ToursState>(
          builder: (context, state) => switch (state.excursionListState) {
            Refreshing(value: Data(value: final excursionList)) ||
            Data(value: final excursionList) =>
                ToursContent(excursionList: excursionList),

            Initial() || Loading() || Refreshing() =>
                AppProgressIndicatorStub(),

            Error() => AppErrorStub(
              retry: () => BlocProvider
                .of<ToursBloc>(context)
                .add(Refresh()),
            ),

            Success() => throw StateError('Invalid state: Success'),
          },
        ),
      ),
    );
}
