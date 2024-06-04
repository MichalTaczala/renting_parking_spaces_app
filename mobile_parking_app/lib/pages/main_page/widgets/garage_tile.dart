import 'package:flutter/material.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';

class GarageTile extends StatelessWidget {
  final ParkingSpotModel parkingDetailsModel;

  const GarageTile({super.key, required this.parkingDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Hero(
                tag: "parking_main_image_${parkingDetailsModel.imagesUrls[0]}",
                child: Image.network(parkingDetailsModel.imagesUrls[0])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "${parkingDetailsModel.address?.street} ${parkingDetailsModel.address?.houseNo}, ${parkingDetailsModel.address?.country}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            "TODO 2,3 km away",
            style: TextStyle(fontSize: 16),
          ),
          Text(
            "${parkingDetailsModel.price} ${parkingDetailsModel.currency} per day",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
