import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/presentation/foundation/app_clickable.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/profile/presentation/bloc/mod.dart';

final class ProfileData extends StatelessWidget {
  final Profile profile;
  const ProfileData({super.key, required this.profile});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: context.appTheme.colors.background.secondary,
      borderRadius: BorderRadius.all(
        Radius.circular(context.appTheme.dimensions.radius.small),
      ),
    ),
    child: Row(
      children: [
        SizedBox(width: context.appTheme.dimensions.padding.medium),

        Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.appTheme.dimensions.padding.medium,
          ),
          child: ProfileAvatarPlaceholder(context: context),
        ),

        SizedBox(width: context.appTheme.dimensions.padding.medium),

        Expanded(
          child: Text(
            profile.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTheme.typography.body.copyWith(
              color: context.appTheme.colors.text.primary,
            ),
          ),
        ),

        SizedBox(width: context.appTheme.dimensions.padding.medium),

        LogOutButton(context: context),

        SizedBox(width: context.appTheme.dimensions.padding.medium),
      ],
    ),
  );

  Widget ProfileAvatarPlaceholder({required BuildContext context}) =>
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.appTheme.colors.background.tertiary,
      ),
      child: ClipOval(
        child: Icon(
          platformCall(
            android: Icons.person,
            iOS: CupertinoIcons.person_alt,
            macOS: CupertinoIcons.person_alt,
          ),
          color: context.appTheme.colors.text.secondary,
          size: context.appTheme.dimensions.size.extraMedium,
        ),
      ),
    );

  Widget LogOutButton({required BuildContext context}) {
    final theme = context.appTheme;
    final iconSize = theme.dimensions.size.small;

    return AppClickable(
      border: CircleBorder(),
      rippleColor: theme.colors.text.disabled,
      onClick: () => BlocProvider.of<ProfileBloc>(context).add(LogOut()),
      child: Padding(
        padding: EdgeInsets.all(theme.dimensions.padding.small),
        child: SvgPicture.asset(
          AppImages.loadSvg('ic_log_out').value,
          width: iconSize,
          height: iconSize,
        ),
      ),
    );
  }
}
