import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_screen.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AuthScreen screen,
  }) = _AuthState;
}
