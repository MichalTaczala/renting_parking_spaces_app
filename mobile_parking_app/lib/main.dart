import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:mobile_parking_app/cubits/authentication_cubit/authentication_state.dart';
import 'package:mobile_parking_app/firebase_options.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';
import 'package:mobile_parking_app/models/user_model.dart';
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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FirebaseUserRepo(),
        ),
        RepositoryProvider(
          create: (context) => GoogleMapsRepository(),
        ),
        RepositoryProvider(
          create: (context) => FlaskRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            AuthenticationCubit(context.read<FirebaseUserRepo>()),
        child: MaterialApp(
          navigatorKey: MainApp.navigatorKey,
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
                      .arguments as ParkingSpotModel,
                ),
            "/payment": (context) => const StripePaymentPage(),
            "/maps": (context) => const MapsPage(),
          },
          builder: (context2, child) {
            return BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context1, state) {
                if (state.status == AuthenticationStatus.authenticated) {
                  context1.read<FlaskRepository>().addUserId(state.user!.uid);
                  context1.read<FlaskRepository>().updateUserProfile(
                        UserModel(
                          firstName: state.user!.displayName?.split(" ")[0],
                          lastName: state.user!.displayName?.split(" ")[1],
                          email: state.user!.email!,
                          phone: state.user!.phoneNumber,
                        ),
                      );
                  MainApp.navigatorKey.currentState
                      ?.pushReplacementNamed("/home");
                } else if (state.status ==
                    AuthenticationStatus.unauthenticated) {
                  MainApp.navigatorKey.currentState
                      ?.pushReplacementNamed("/logIn");
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
