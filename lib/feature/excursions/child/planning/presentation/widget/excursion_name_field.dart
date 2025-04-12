import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/text/app_text_field.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/planning/presentation/bloc/mod.dart';

final class ExcursionNameField extends StatefulWidget {
  final String initialText;
  final String placeholder;
  final void Function(String) onExcursionNameChanged;

  const ExcursionNameField({
    super.key,
    required this.initialText,
    required this.placeholder,
    required this.onExcursionNameChanged,
  });

  @override
  State<StatefulWidget> createState() => _ExcursionNameFieldState();
}

final class _ExcursionNameFieldState extends State<ExcursionNameField> {

  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocBuilder<PlanningBloc, PlanningState>(
      builder: (context, state) => AppTextField(
        controller: controller,
        placeholder: widget.placeholder,
        error: state.excursionName.error ? strings.planning_title_error : null,
        suffix: SvgPicture.asset(
          AppImages.loadSvg('ic_edit').value,
          width: theme.dimensions.size.extraSmall,
          height: theme.dimensions.size.extraSmall,
        ),
        onChanged: widget.onExcursionNameChanged,
      ),
    );
  }
}
