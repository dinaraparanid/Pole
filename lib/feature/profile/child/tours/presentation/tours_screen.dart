import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/stub/app_progress_indicator_stub.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/profile/child/tours/presentation/bloc/mod.dart';
import 'package:pole/feature/profile/child/tours/presentation/widget/tours_content.dart';

final class FavouritesScreen extends StatelessWidget {
  final ToursBlocFactory blocFactory;

  const FavouritesScreen({
    super.key,
    required this.blocFactory,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => blocFactory(),
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
  );
}
