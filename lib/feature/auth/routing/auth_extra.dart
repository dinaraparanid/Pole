import 'package:pole/feature/auth/child/sign_in/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/child/sign_up/presentation/bloc/mod.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_bloc.dart';

final class AuthExtra {
  final AuthBloc authBloc;
  final SignInBloc? signInBloc;
  final SignUpBloc? signUpBloc;

  AuthExtra({
    required this.authBloc,
    this.signInBloc,
    this.signUpBloc,
  });
}
