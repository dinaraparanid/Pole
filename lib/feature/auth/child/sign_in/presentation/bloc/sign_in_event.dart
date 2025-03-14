sealed class SignInEvent {}

final class SignUpClick extends SignInEvent {}

final class ConfirmClick extends SignInEvent {}

final class EmailChange extends SignInEvent {
  final String email;
  EmailChange({required this.email});
}

final class PasswordChange extends SignInEvent {
  final String password;
  PasswordChange({required this.password});
}
