import 'package:pole/feature/excursions/child/creation_finish/presentation/bloc/creation_finish_cubit.dart';
import 'package:pole/navigation/app_router.dart';

final class CreationFinishCubitFactory {
  final AppRouter _router;

  CreationFinishCubitFactory({required AppRouter router}) :
    _router = router;

  CreationFinishCubit create() => CreationFinishCubit(router: _router);
}
