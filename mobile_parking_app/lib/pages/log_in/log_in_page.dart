import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_state.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushReplacementNamed("/home");
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/car_in_garage.jpg",
                ),
              ),
            ),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: ElevatedButton(
                    // style: const ButtonStyle(
                    //   backgroundColor: MaterialStateProperty.all(Colors.white),
                    //   padding: MaterialStateProperty.all(
                    //     const EdgeInsets.symmetric(
                    //       vertical: 10,
                    //       horizontal: 20,
                    //     ),
                    //   ),
                    //   shape: MaterialStateProperty.all(
                    //     RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // ),
                    onPressed: context.read<AuthenticationCubit>().logIn,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/google_logo.png",
                          fit: BoxFit.scaleDown,
                          width: 40,
                        ),
                        Text(
                          "Sign in with google",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
