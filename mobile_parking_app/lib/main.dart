import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_state.dart';
import 'package:mobile_parking_app/firebase_options.dart';
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/pages/add_parking/add_parking_page.dart';
import 'package:mobile_parking_app/pages/log_in/log_in_page.dart';
import 'package:mobile_parking_app/pages/main_page/main_page.dart';
import 'package:mobile_parking_app/pages/maps_page.dart';
import 'package:mobile_parking_app/pages/parking_details/parking_details_page.dart';
import 'package:mobile_parking_app/pages/stripe_payment/stripe_payment_page.dart';
import 'package:mobile_parking_app/repositories/firebase_user_repo.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/repositories/google_maps_repository.dart';
import 'package:mobile_parking_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load();
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirebaseUserRepo(),
        ),
        RepositoryProvider(
          create: (context) => FlaskRepository(),
        ),
        RepositoryProvider(
          create: (context) => GoogleMapsRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            AuthenticationCubit(context.read<FirebaseUserRepo>()),
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: mainTheme,
          initialRoute: "/logIn",
          routes: {
            "/home": (context) => const MainScreen(),
            "/logIn": (context) => const LogInPage(),
            "/parkingDetails": (
              context,
            ) =>
                ParkingDetailsPage(
                  parkingDetailsModel: ModalRoute.of(context)!
                      .settings
                      .arguments as ParkingDetailsModel,
                ),
            "/payment": (context) => const StripePaymentPage(),
            "/addParkingSpot": (context) => const AddParkingScreen(),
            "/maps": (context) => const MapsPage(),
          },
          builder: (context2, child) {
            return BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context1, state) {
                if (state.status == AuthenticationStatus.authenticated) {
                  context1
                      .read<FlaskRepository>()
                      .changeUserId(state.user!.uid);
                  navigatorKey.currentState?.pushReplacementNamed("/home");
                } else if (state.status ==
                    AuthenticationStatus.unauthenticated) {
                  navigatorKey.currentState?.pushReplacementNamed("/logIn");
                }
              },
              child: SafeArea(child: child ?? Container()),
            );
          },
        ),
      ),
    );
  }
}
