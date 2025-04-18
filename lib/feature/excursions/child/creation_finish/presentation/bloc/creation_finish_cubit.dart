import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/navigation/app_route.dart';
import 'package:pole/navigation/app_router.dart';

final class CreationFinishCubit extends Cubit<void> {
  final AppRouter _router;

  CreationFinishCubit({required AppRouter router}) :
    _router = router, super(null);

  void goToProfile() {
    _router.value.goNamed(AppRoute.profile.name);
  }
}
