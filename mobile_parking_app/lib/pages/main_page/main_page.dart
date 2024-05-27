import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/main_data/main_data_cubit.dart';
import 'package:mobile_parking_app/pages/main_page/views/choose_parking_view.dart';
import 'package:mobile_parking_app/pages/main_page/views/profile_view.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/repositories/google_maps_repository.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainDataCubit(
          flaskRepository: context.read<FlaskRepository>(),
          googleMapsRepository: context.read<GoogleMapsRepository>()),
      child: const MainPage(),
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
          ProfileView(),
        ],
        onPageChanged: (index) {
          setState(() {
            idx = index;
          });
        },
      ),
      // body: switch (idx) {
      //   0 => BlocProvider.value(
      //       value: context.read<MainDataCubit>(),
      //       child: const ChooseParkingView(),
      //     ),
      //   1 => const ProfileView(),
      //   int() => throw UnimplementedError(),
      // },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
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
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        // fixedColor: Colors.blue[400],
      ),
    );
  }
}
