import 'package:get_it/get_it.dart';
import 'package:pole/core/di/provide.dart';
import 'package:pole/feature/excursions/child/creation_finish/presentation/bloc/creation_finish_cubit_factory.dart';

extension CreationFinishModule on GetIt {
  List<Type> registerCreationFinishModule() => [
    provideSingleton<CreationFinishCubitFactory>(() => CreationFinishCubitFactory(
      router: this(),
    )),
  ];
}
