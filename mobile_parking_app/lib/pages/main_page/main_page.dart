import 'package:flutter/material.dart';
import 'package:mobile_parking_app/pages/main_page/views/choose_parking_view.dart';
import 'package:mobile_parking_app/pages/main_page/views/profile_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (idx) {
        0 => const ChooseParkingView(),
        1 => const ProfileView(),
        int() => throw UnimplementedError(),
      },
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (index) {
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
        fixedColor: Colors.blue[400],
      ),
    );
  }
}
