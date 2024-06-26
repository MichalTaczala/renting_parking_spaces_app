import 'package:bloc/bloc.dart';
import 'package:mobile_parking_app/repositories/firebase_user_repo.dart';

import 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final FirebaseUserRepo _firebaseUserRepo;
  AuthenticationCubit(this._firebaseUserRepo)
      : super(const AuthenticationState());

  void logIn() {
    _firebaseUserRepo.signInWithGoogle().then((user) {
      if (user == null) {
        emit(
          state.copyWith(
            status: AuthenticationStatus.unauthenticated,
          ),
        );
      } else {
        emit(
          state.copyWith(
            user: user,
            status: AuthenticationStatus.authenticated,
          ),
        );
      }
    });
  }

  void logOut() {
    _firebaseUserRepo.signOut().then((_) {
      emit(
        state.copyWith(
          user: null,
          status: AuthenticationStatus.unauthenticated,
        ),
      );
    });
  }
}
