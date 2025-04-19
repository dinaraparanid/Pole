import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/core/domain/text/text_container.dart';
import 'package:pole/core/utils/ext/bool.dart';

part 'sign_up_state.freezed.dart';

const _passwordMinLength = 8;

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> name,

    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> email,

    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> password,

    @Default(TextContainer(value: '', error: false))
    TextContainer<bool> confirmPassword,

    @Default(false) bool isConfirmButtonLoading,
  }) = _SignUpState;
}

extension Properties on SignUpState {
  bool matchesPassword(String text) => password.value == text;

  bool get isPasswordConfirmed => password.value == confirmPassword.value;

  bool isSmallForPassword(String text) => text.length < _passwordMinLength;

  bool get isPasswordSmall => isSmallForPassword(password.value);

  bool get isConfirmButtonEnabled =>
    name.value.isNotEmpty && email.value.isNotEmpty &&
        isPasswordSmall.not && isPasswordConfirmed;
}
