import 'package:flutter/material.dart';

class GarageTile extends StatelessWidget {
  final String imagelink;
  final String address;
  final String dateRange;
  final String cost;

  const GarageTile({super.key, required this.imagelink, required this.address, required this.dateRange, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset("assets/images/garage.jpeg"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "ul. Marokańska, Praga południe",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "2,3 km away",
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            "Apr. 19-24",
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            "10 zł/h",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
