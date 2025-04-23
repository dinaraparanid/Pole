import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/stub/app_progress_indicator_stub.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/feature/profile/child/favourites/presentation/bloc/mod.dart';
import 'package:pole/feature/profile/child/favourites/presentation/widget/favourites_content.dart';

final class FavouritesScreen extends StatelessWidget {
  final FavouritesBlocFactory blocFactory;

  const FavouritesScreen({
    super.key,
    required this.blocFactory,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => blocFactory(),
    child: BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) => switch (state.excursionListState) {
        Refreshing(value: Data(value: final excursionList)) ||
        Data(value: final excursionList) =>
          FavouritesContent(excursionList: excursionList),

        Initial() || Loading() || Refreshing() =>
          AppProgressIndicatorStub(),

        Error() => AppErrorStub(
          retry: () => BlocProvider
            .of<FavouritesBloc>(context)
            .add(Refresh()),
        ),

        Success() => throw StateError('Invalid state: Success'),
      },
    ),
  );
}