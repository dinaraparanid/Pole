import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/utils/ext/bool.dart';

part 'sign_in_state.freezed.dart';

const _passwordMinLength = 8;

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> email,

    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> password,

    @Default(false) bool isConfirmButtonLoading,
  }) = _SignUpState;
}

extension Properties on SignInState {
  bool isSmallForPassword(String text) => text.length < _passwordMinLength;

  bool get isPasswordSmall => isSmallForPassword(password.value);

  bool get isConfirmButtonEnabled =>
    email.value.isNotEmpty && isPasswordSmall.not;
}
