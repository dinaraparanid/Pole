import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/profile/presentation/bloc/mod.dart';

const _itemAnimationDuration = Duration(milliseconds: 300);

final class TourFilterLine extends StatelessWidget {
  const TourFilterLine({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FilterItem(
            context: context,
            title: context.strings.profile_favourites,
            isSelected: state.filter == TourFilter.favourites,
            onClick: () => BlocProvider
              .of<ProfileBloc>(context)
              .add(SelectTourFilter(filter: TourFilter.favourites)),
          ),

          SizedBox(width: context.appTheme.dimensions.padding.extraBig),

          FilterItem(
            context: context,
            title: context.strings.profile_archive,
            isSelected: state.filter == TourFilter.archive,
            onClick: () => BlocProvider
              .of<ProfileBloc>(context)
              .add(SelectTourFilter(filter: TourFilter.archive)),
          ),
        ],
      ),
    ),
  );

  Widget FilterItem({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required void Function() onClick,
}) {
    final theme = context.appTheme;

    final borderRadius = BorderRadius.all(
      Radius.circular(theme.dimensions.radius.small),
    );

    return AnimatedContainer(
      duration: _itemAnimationDuration,
      decoration: BoxDecoration(
        color: isSelected
          ? theme.colors.uniqueComponents.activeFilter
          : theme.colors.background.secondary,
        border: Border.all(
          width: theme.dimensions.size.line.small,
          color: isSelected
            ? theme.colors.primary
            : theme.colors.background.tertiary,
        ),
        borderRadius: borderRadius,
      ),
      child: AppClickable(
        onClick: onClick,
        rippleColor: theme.colors.text.unfocused,
        border: RoundedRectangleBorder(borderRadius: borderRadius),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: theme.dimensions.padding.small,
            horizontal: theme.dimensions.padding.extraBig,
          ),
          child: Text(
            title,
            style: theme.typography.body.copyWith(
              color: isSelected
                ? theme.colors.primary
                : theme.colors.text.disabled,
            ),
          ),
        ),
      ),
    );
  }
}