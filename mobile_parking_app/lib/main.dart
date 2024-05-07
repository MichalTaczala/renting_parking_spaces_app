import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_state.dart';
import 'package:mobile_parking_app/firebase_options.dart';
import 'package:mobile_parking_app/pages/choose_parking/choose_parking_page.dart';
import 'package:mobile_parking_app/pages/log_in/log_in_page.dart';
import 'package:mobile_parking_app/pages/parking_details/parking_details_page.dart';
import 'package:mobile_parking_app/pages/stripe_payment/stripe_payment_page.dart';
import 'package:mobile_parking_app/repositories/firebase_user_repo.dart';
import 'package:mobile_parking_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Stripe.publishableKey =
      'pk_test_51NldnEDNOsFHC8X3bRdzKuznF4HKto9DJKdWGUpfki9h6wvALOuCuD1vvHB9WvrNEYWx0vnCbpe2yjHJgXpYPr3P00XFDkInWx';
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirebaseUserRepo(),
      child: BlocProvider(
        create: (context) =>
            AuthenticationCubit(context.read<FirebaseUserRepo>()),
        child: BlocListener<AuthenticationCubit, AuthenticationState>(
          listener: (context, state) {
            // if (state.status == AuthenticationStatus.authenticated) {
            //   Navigator.of(context).pushReplacementNamed("/home");
            // }
            // if (state.status == AuthenticationStatus.unauthenticated) {
            //   Navigator.of(context).pushReplacementNamed("/logIn");
            // }
          },
          child: SafeArea(
            child: MaterialApp(
              theme: mainTheme,
              initialRoute: "/payment",
              routes: {
                "/home": (context) => const ChooseParkingPage(),
                "/logIn": (context) => const LogInPage(),
                "/parkingDetails": (context) => const ParkingDetailsPage(),
                "/payment": (context) => StripePaymentPage(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
