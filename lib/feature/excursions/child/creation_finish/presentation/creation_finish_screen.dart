import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pole/core/presentation/foundation/app_button.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/excursions/child/creation_finish/presentation/bloc/creation_finish_cubit.dart';
import 'package:pole/feature/excursions/child/creation_finish/presentation/bloc/creation_finish_cubit_factory.dart';

final class CreationFinishScreen extends StatelessWidget {
  final CreationFinishCubitFactory cubitFactory;
  const CreationFinishScreen({super.key, required this.cubitFactory});

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final strings = context.strings;

    return BlocProvider(
      create: (_) => cubitFactory.create(),
      child: BlocBuilder<CreationFinishCubit, void>(
        builder: (context, _) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.dimensions.padding.extraMedium,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.loadSvg('ic_success').value,
                width: theme.dimensions.size.extraMedium,
                height: theme.dimensions.size.extraMedium,
              ),

              SizedBox(height: theme.dimensions.padding.large),

              Text(
                strings.finish_title,
                textAlign: TextAlign.center,
                style: theme.typography.h.h4.copyWith(
                  color: theme.colors.text.primary,
                ),
              ),

              SizedBox(height: theme.dimensions.padding.small),

              Text(
                strings.finish_description,
                textAlign: TextAlign.center,
                style: theme.typography.body.copyWith(
                  color: theme.colors.text.secondary,
                ),
              ),

              SizedBox(height: theme.dimensions.padding.large),

              AppButton(
                text: strings.finish_confirm,
                onClick: BlocProvider
                  .of<CreationFinishCubit>(context)
                  .goToProfile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
