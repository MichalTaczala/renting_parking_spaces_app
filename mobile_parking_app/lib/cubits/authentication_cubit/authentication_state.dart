import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';



enum AuthenticationStatus { unknown, authenticated, unauthenticated }


@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    User? user,
    @Default(AuthenticationStatus.unknown) AuthenticationStatus status,
  }) = _AuthenticationState;
}


