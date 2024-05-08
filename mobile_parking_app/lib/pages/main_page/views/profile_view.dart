import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed("/addParkingSpot"),
          child: const Text(
            "Add Parking Spot",
          ),
        ),
        ElevatedButton(
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
        ),
      ],
    );
  }
}
