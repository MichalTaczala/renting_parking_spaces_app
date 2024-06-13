import 'package:bloc/bloc.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';

import 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  ProfileDataCubit(this.flaskRepo) : super(const ProfileDataState());
  final FlaskRepository flaskRepo;

  void updateProfileData() async {
    final userData = await flaskRepo.getUser();
    emit(
      ProfileDataState(
        name: userData.firstName,
        surname: userData.lastName,
        email: userData.email,
        phone: userData.phone,
      ),
    );
  }
}
