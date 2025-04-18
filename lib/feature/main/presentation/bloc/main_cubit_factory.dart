import 'package:pole/feature/main/presentation/bloc/main_cubit.dart';
import 'package:pole/navigation/app_router.dart';

final class MainCubitFactory {
  final AppRouter _router;

  MainCubitFactory({required AppRouter router}) : _router = router;

  MainCubit create() => MainCubit(router: _router);
}
