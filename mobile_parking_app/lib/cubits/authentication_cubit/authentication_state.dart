import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

enum AuthenticationStatus { authenticated, unauthenticated }

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    User? user,
    @Default(AuthenticationStatus.unauthenticated) AuthenticationStatus status,
  }) = _AuthenticationState;
}
