import 'package:flutter/material.dart';
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/pages/main_page/widgets/garage_tile.dart';

class ChooseParkingView extends StatefulWidget {
  const ChooseParkingView({super.key});

  @override
  State<ChooseParkingView> createState() => _ChooseParkingViewState();
}

class _ChooseParkingViewState extends State<ChooseParkingView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 59,
          ),
          Row(
            children: [
              const Spacer(),
              Icon(
                Icons.location_on_sharp,
                color: Colors.blue[400],
              ),
              DropdownButton<String>(
                iconEnabledColor: Colors.blue[400],
                items: const [
                  DropdownMenuItem(
                    value: "Warsaw, PL",
                    child: Text("Warsaw, PL"),
                  ),
                  DropdownMenuItem(
                    value: "Krakow, PL",
                    child: Text("Krakow, PL"),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    // _location = value!;
                  });
                },
                // value: _location,
              ),
            ],
          ),
          const Text(
            "ParkNest",
            style: TextStyle(
              fontSize: 60,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    "/parkingDetails",
                    arguments: ParkingDetailsModel(
                      id: "id",
                      name: "name",
                      address: "address",
                      phone: "phone",
                      email: "email",
                      images: [],
                      description: "description",
                      latitude: "latitude",
                      longitude: "longitude",
                      price: 21.37,
                      currency: "USD",
                      rating: "rating",
                      distance: "distance",
                    ),
                  ),
                  child: const GarageTile(
                    address: "a",
                    cost: "a",
                    dateRange: "a",
                    imagelink: "a",
                  ),
                );
              },
              padding: EdgeInsets.zero,
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
