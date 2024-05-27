import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points_plus/flutter_polyline_points_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowParkingOnMap extends StatefulWidget {
  const ShowParkingOnMap({super.key, required this.initialCameraPosition});
  final LatLng initialCameraPosition;

  @override
  State<ShowParkingOnMap> createState() => _ShowParkingOnMapState();
}

class _ShowParkingOnMapState extends State<ShowParkingOnMap> {
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      dotenv.env['GOOGLE_MAPS_API_KEY']!,
      PointLatLng(widget.initialCameraPosition.latitude,
          widget.initialCameraPosition.longitude),
      PointLatLng(
        widget.initialCameraPosition.latitude,
        widget.initialCameraPosition.longitude,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      key: const ValueKey('show_parking_on_map'),
      initialCameraPosition:
          CameraPosition(target: widget.initialCameraPosition, zoom: 13.5),
      markers: {
        Marker(
          markerId: MarkerId(widget.initialCameraPosition.toString()),
          position: widget.initialCameraPosition,
        ),
      },
    );
  }
}
