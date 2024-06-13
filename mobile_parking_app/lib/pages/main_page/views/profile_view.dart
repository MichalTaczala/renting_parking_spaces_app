import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:mobile_parking_app/cubits/profile_data/profile_data_cubit.dart';
import 'package:mobile_parking_app/cubits/profile_data/profile_data_state.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileDataCubit(context.read<FlaskRepository>()),
      child: const ProfileViewImpl(),
    );
  }
}

class ProfileViewImpl extends StatelessWidget {
  const ProfileViewImpl({super.key});

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLogOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: context.read<AuthenticationCubit>().logOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
      child: const Text(
        "Log Out",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProfileDataCubit>().updateProfileData();
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Your profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                buildRow("Name: ", "${state.name} ${state.surname}"),
                buildRow("Email: ", "${state.email}"),
                buildRow("Phone: ", "${state.phone}"),
                const Spacer(),
                buildLogOutButton(context),
              ],
            ));
      },
    );
  }
}
