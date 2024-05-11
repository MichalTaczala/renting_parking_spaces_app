import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class GoogleMapsRepository {
  Future<String> getNameFromLatLng({
    required LatLng latLng,
  }) async {
    final name = await http.get(
      Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=${dotenv.env['GOOGLE_MAPS_API_KEY']}",
      ),
    );
    return name.body;
  }
}
