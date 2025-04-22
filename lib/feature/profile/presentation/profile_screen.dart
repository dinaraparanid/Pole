import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pole/core/domain/account/entity/profile.dart';
import 'package:pole/core/presentation/foundation/stub/app_error_stub.dart';
import 'package:pole/core/presentation/foundation/stub/app_progress_indicator_stub.dart';
import 'package:pole/core/presentation/foundation/ui_state.dart';
import 'package:pole/core/presentation/theme/mod.dart';
import 'package:pole/feature/profile/presentation/bloc/mod.dart';
import 'package:pole/feature/profile/presentation/widget/profile_content.dart';

final class ProfileScreen extends StatelessWidget {
  final ProfileBlocFactory blocFactory;
  final Widget child;

  const ProfileScreen({
    super.key,
    required this.blocFactory,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => blocFactory(),
    child: BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) => switch (state.profileState) {
        Refreshing<Profile>(value: Data(value: final Profile profile)) ||
        Data<Profile>(value: final Profile profile) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.appTheme.dimensions.padding.large,
          ),
          child: ProfileContent(profile: profile, child: child),
        ),

        Initial<Profile>() || Loading<Profile>() || Refreshing<Profile>() =>
          AppProgressIndicatorStub(),

        Error<Profile>() => AppErrorStub(
          retry: () => BlocProvider
            .of<ProfileBloc>(context)
            .add(Refresh()),
        ),

        Success<Profile>() => throw StateError('Invalid state: Success'),
      },
    ),
  );
}
