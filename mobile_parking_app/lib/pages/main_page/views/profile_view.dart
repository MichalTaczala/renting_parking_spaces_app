import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () => Navigator.of(context).pushNamed("/addParkingSpot"),
            //   child: const Text(
            //     "Add Parking Spot",
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: context.read<AuthenticationCubit>().logOut,
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all(Colors.red),
            //   ),
            //   child: const Text(
            //     "Log Out",
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            const Center(
              child: Text(
                "Your profile",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            buildRow("Name: ", "John Doe"),
            buildRow("Email: ", "abc@gmail.com"),
            buildRow("Phone: ", "1234567890"),
            const Spacer(),
            buildLogOutButton(context),
          ],
        ));
  }
}
