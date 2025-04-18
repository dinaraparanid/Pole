import 'package:pole/feature/root/domain/entity/root_route.dart';

final class InitialScreenUseCase {
  InitialScreenUseCase();

  Future<RootRoute> get initialScreen async =>
      RootRoute.splash; // TODO зарос из репозитория
}
