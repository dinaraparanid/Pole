import 'package:pole/feature/root/domain/entity/root_screen.dart';

final class InitialScreenUseCase {
  InitialScreenUseCase();

  Future<RootScreen> get initialScreen async =>
      RootScreen.splash; // TODO зарос из репозитория
}
