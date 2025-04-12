import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/text/text_change_use_case.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';
import 'package:pole/core/utils/ext/general.dart';
import 'package:pole/feature/excursions/child/planning/child/visit_duration/presentation/bloc/mod.dart';

final class VisitDurationCubit extends Cubit<VisitDurationState> {
  final TextChangeUseCase _textChangeUseCase;
  final void Function(Duration) _onResult;

  VisitDurationCubit({
    required TextChangeUseCase textChangeUseCase,
    required VisitPlace place,
    required Duration maxDuration,
    required void Function(Duration) onResult,
  }) : _textChangeUseCase = textChangeUseCase,
    _onResult = onResult,
    super(VisitDurationState(place: place, maxDuration: maxDuration));

  void updateInput(String input) => _textChangeUseCase.execute(
    next: input,
    errorPredicate: _validateInput,
    update: (textContainer) => emit(state.copyWith(input: textContainer)),
  );

  void confirm() => state.input.value
    .toIntOrNull()
    ?.let((h) => _onResult(Duration(hours: h)));

  VisitDurationInputError? _validateInput(String input) {
    final hours = input.toIntOrNull()?.takeIf((it) => it > 0);

    if (hours == null) {
      return InvalidInput();
    }

    if (state.maxDuration < Duration(hours: hours)) {
      return TooLongDuration();
    }

    return null;
  }
}
