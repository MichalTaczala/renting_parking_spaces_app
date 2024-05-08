import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_parking_app/models/parking_details_model.dart';

class FlaskRepository {
  Future<void> addParkingSpot(ParkingDetailsModel model) async {
    final url = Uri.parse('http://');
    final response = await http.post(
      url,
      body: jsonEncode(model.toJson()),
    );
  }

  Future<void> addParkingSpotImages(List<File> images) async {
    final url = Uri.parse('http://');
    final request = http.MultipartRequest('POST', url);
    for (var image in images) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'images',
          image.readAsBytesSync(),
          filename: image.path.split('/').last,
        ),
      );
    }
    await request.send();
  }
}
