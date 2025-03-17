import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/feature/excursions/presentation/bloc/excursions_state.dart';

final class ExcursionsBloc extends Bloc<void, ExcursionsState> {
  ExcursionsBloc() : super(ExcursionsState());
}
