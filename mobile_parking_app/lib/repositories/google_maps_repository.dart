import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_parking_app/models/address_model.dart';

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

  Future<AddressModel> getAddressFromPlaceId(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${dotenv.env['GOOGLE_MAPS_API_KEY']}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] != 'OK') {
        throw Exception('Failed to load address');
      }
      final result = json['result'];
      final addressComponents = result['address_components'];
      final geometry = result['geometry']['location'];

      final lat = geometry['lat'];
      final lng = geometry['lng'];

      String? city;
      String? country;
      String? street;
      String? houseNumber;
      String? postalCode;

      for (var component in addressComponents) {
        final types = component['types'];
        if (types.contains('locality')) {
          city = component['long_name'];
        } else if (types.contains('country')) {
          country = component['long_name'];
        } else if (types.contains('route')) {
          street = component['long_name'];
        } else if (types.contains('street_number')) {
          houseNumber = component['long_name'];
        } else if (types.contains('postal_code')) {
          postalCode = component['long_name'];
        }
      }

      return AddressModel(
        street: street ?? ".",
        houseNo: houseNumber,
        city: city,
        postalCode: postalCode,
        country: country,
        lat: lat.toString(),
        long: lng.toString(),
      );
    } else {
      throw Exception('Failed to load address');
    }
  }
}
