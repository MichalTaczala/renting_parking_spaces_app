import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobile_parking_app/utils/location_utils.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final locationController = Location();
  StreamSubscription<LocationData>? locationSubscription;

  LatLng? currentPosition;
  LatLng? choosenLocationForGarage;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await fetchLocationUpdates());
  }

  @override
  void dispose() {
    locationSubscription?.cancel();
    super.dispose();
  }

  Future<void> fetchLocationUpdates() async {
    fetchCurrentLocation(locationController);
    locationSubscription = locationController.onLocationChanged.listen(
      (LocationData currentLocation) {
        if (currentLocation.latitude == null ||
            currentLocation.longitude == null) {
          return;
        }
        setState(
          () {
            currentPosition =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (controller) => mapController = controller,
                    initialCameraPosition: CameraPosition(
                      target: currentPosition!,
                      zoom: 13,
                    ),
                    onTap: (LatLng latLng) {
                      setState(
                        () {
                          choosenLocationForGarage = latLng;
                        },
                      );
                    },
                    markers: {
                      if (choosenLocationForGarage != null)
                        Marker(
                          markerId: const MarkerId('choosenLocationForGarage'),
                          position: choosenLocationForGarage!,
                          infoWindow:
                              const InfoWindow(title: 'Garage Location'),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueGreen),
                        ),
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: ElevatedButton(
                      onPressed: choosenLocationForGarage == null
                          ? null
                          : () {
                              Navigator.of(context)
                                  .pop(choosenLocationForGarage);
                            },
                      child: Text(
                        choosenLocationForGarage == null
                            ? "Click to choose the location"
                            : "Save Location",
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
