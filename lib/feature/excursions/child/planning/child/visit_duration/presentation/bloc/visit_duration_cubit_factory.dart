import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/core/domain/visit_place/entity/visit_place.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/visit_duration_cubit.dart';

final class VisitDurationCubitFactory {
  final TextChangeUseCase _textChangeUseCase;

  VisitDurationCubitFactory({
    required TextChangeUseCase textChangeUseCase,
  }) : _textChangeUseCase = textChangeUseCase;

  VisitDurationCubit create({
    required VisitPlace place,
    required Duration maxDuration,
    required void Function(Duration) onResult,
  }) => VisitDurationCubit(
    textChangeUseCase: _textChangeUseCase,
    place: place,
    maxDuration: maxDuration,
    onResult: onResult,
  );
}
