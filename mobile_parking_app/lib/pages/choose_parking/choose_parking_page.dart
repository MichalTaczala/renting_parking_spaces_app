import 'package:flutter/material.dart';
import 'package:mobile_parking_app/pages/choose_parking/parking_space_tile.dart';
import 'package:mobile_parking_app/theme.dart';

class ChooseParkingPage extends StatelessWidget {
  const ChooseParkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.brown,
      appBar: AppBar(
        title: const Text(
          'Choose Parking Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => const ParkingSpaceTile(),
        ),
      ),
    );
  }
}
