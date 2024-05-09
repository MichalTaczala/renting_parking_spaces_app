import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Future<LatLng?> fetchCurrentLocation(Location locationController) async {
  //TODO BAD NAME AND FUNCTIONALITY
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  serviceEnabled = await locationController.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await locationController.requestService();
  }
  permissionGranted = await locationController.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await locationController.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }
  final location = await locationController.getLocation();
  return LatLng(location.latitude!, location.longitude!);
}
