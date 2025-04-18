import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pole/feature/auth/presentation/bloc/auth_route.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    required AuthRoute route,
  }) = _AuthState;
}
