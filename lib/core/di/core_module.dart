import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';

extension CoreModule on GetIt {
  List<Type> registerCoreModule() => [
    provideSingleton(() => TextChangeUseCase()),
  ];
}
