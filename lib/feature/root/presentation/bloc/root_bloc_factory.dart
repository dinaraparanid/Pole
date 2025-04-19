import 'package:pole/core/domain/auth/data_source/auth_store.dart';
import 'package:pole/feature/root/presentation/bloc/root_bloc.dart';
import 'package:pole/navigation/app_router.dart';

final class RootBlocFactory {
  final AppRouter _router;
  final AuthStore _authStore;

  RootBlocFactory({
    required AppRouter router,
    required AuthStore authStore,
  }) : _router = router, _authStore = authStore;

  RootBloc create() => RootBloc(
    router: _router,
    authStore: _authStore,
  );
}
