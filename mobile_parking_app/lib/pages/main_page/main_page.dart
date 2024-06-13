import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/add_parking_spot_cubit/add_parking_spot_cubit.dart';
import 'package:mobile_parking_app/cubits/main_data/main_data_cubit.dart';
import 'package:mobile_parking_app/pages/main_page/views/add_parking_spot_view.dart';
import 'package:mobile_parking_app/pages/main_page/views/choose_parking_view.dart';
import 'package:mobile_parking_app/pages/main_page/views/my_garages_view.dart';
import 'package:mobile_parking_app/pages/main_page/views/my_offers_view.dart';
import 'package:mobile_parking_app/pages/main_page/views/profile_view.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/repositories/google_maps_repository.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GoogleMapsRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainDataCubit(
              flaskRepository: context.read<FlaskRepository>(),
              googleMapsRepository: context.read<GoogleMapsRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => AddParkingSpotCubit(
              context.read<FlaskRepository>(),
              context.read<GoogleMapsRepository>(),
            ),
          ),
        ],
        child: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int idx = 0;
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          ChooseParkingView(),
          AddParkingSpotView(),
          MyOffersView(),
          MyGaragesView(),
          ProfileView(),
        ],
        onPageChanged: (index) {
          setState(() {
            idx = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          setState(() {
            idx = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Garage",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: "My Bookings"),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: "My Garages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
