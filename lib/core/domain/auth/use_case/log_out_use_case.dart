import 'package:pole/core/domain/store_cleaner.dart';
import 'package:pole/navigation/app_router.dart';

final class LogOutUseCase {
  final StoreCleaner _storeCleaner;
  final AppRouter _router;

  LogOutUseCase({
    required StoreCleaner storeCleaner,
    required AppRouter router,
  }) : _storeCleaner = storeCleaner, _router = router;

  Future<void> call() async {
    await _storeCleaner();
    _router.clearBackStackHistory();
  }
}
