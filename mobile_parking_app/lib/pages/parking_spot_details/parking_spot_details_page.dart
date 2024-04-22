import 'package:flutter/material.dart';

class ParkingSpotDetailsPage extends StatelessWidget {
  const ParkingSpotDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 400,
            child: Text("image here"),
          ),
          Container(
            color: Colors.white,
            child: const Row(
              children: [
                Text("some info"),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: null,
              child: Text(
                "Book Now",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
