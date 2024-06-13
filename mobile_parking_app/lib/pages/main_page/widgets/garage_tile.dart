import 'package:flutter/material.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';
import 'package:mobile_parking_app/utils/helper_functions.dart';

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
          Hero(
            tag: "parking_main_image_${parkingDetailsModel.spotId}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                parkingDetailsModel.imagesUrls.isNotEmpty
                    ? parkingDetailsModel.imagesUrls[0]
                    : "https://as2.ftcdn.net/v2/jpg/07/95/29/45/1000_F_795294547_gaBzWLhkAYBSz1ZUIZssHhvzGzstNmHK.jpg",
              ),
            ),
          ),
          Text(
            parkingDetailsModel.name ?? "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            getReadableAddress(parkingDetailsModel.address),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (parkingDetailsModel.distance != null)
            Text(
              "${double.parse(
                parkingDetailsModel.distance!.toStringAsFixed(
                  2,
                ),
              )} km away",
              style: const TextStyle(fontSize: 16),
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
