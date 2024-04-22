import 'package:flutter/material.dart';
import 'package:mobile_parking_app/pages/choose_parking/stars_rating_widget.dart';

class ParkingSpaceTile extends StatelessWidget {
  const ParkingSpaceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color.fromARGB(255, 117, 51 + 10, 46),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(6),
              ),
              color: Colors.white,
            ),
            child: const Column(
              children: [
                StartRatingWidget(starNumber: 4.5),
                Text(
                  "\$48",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
