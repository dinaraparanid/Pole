sealed class SignUpEvent {}

final class SignInClick extends SignUpEvent {}

final class ConfirmClick extends SignUpEvent {}

final class NameChange extends SignUpEvent {
  final String name;
  NameChange({required this.name});
}

final class EmailChange extends SignUpEvent {
  final String email;
  EmailChange({required this.email});
}

final class PasswordChange extends SignUpEvent {
  final String password;
  PasswordChange({required this.password});
}

final class ConfirmPasswordChange extends SignUpEvent {
  final String password;
  ConfirmPasswordChange({required this.password});
}
