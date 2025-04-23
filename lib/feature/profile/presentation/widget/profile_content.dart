import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/profile/presentation/bloc/mod.dart';
import 'package:pole/feature/profile/presentation/widget/profile_data.dart';
import 'package:pole/feature/profile/presentation/widget/tour_filter_line.dart';

final class ProfileContent extends StatelessWidget {
  final Profile profile;
  final Widget child;

  const ProfileContent({
    super.key,
    required this.profile,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
    builder: (context, state) => Column(
      children: [
        SizedBox(height: context.appTheme.dimensions.padding.large),

        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            AppImages.loadSvg('app_label').value,
          ),
        ),

        SizedBox(height: context.appTheme.dimensions.padding.large),

        ProfileData(profile: profile),

        SizedBox(height: context.appTheme.dimensions.padding.extraBig),

        TourFilterLine(),

        SizedBox(height: context.appTheme.dimensions.padding.extraBig),

        child
      ],
    ),
  );
}