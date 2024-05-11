import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/repositories/main_interceptor.dart';

class FlaskRepository {
  late String firebaseUserId;
  late Client client;

  void changeUserId(String userId) {
    firebaseUserId = userId;
    client = InterceptedClient.build(
      interceptors: [MainInterceptor(firebaseUserId: firebaseUserId)],
    );
  }

  Future<void> addParkingSpot(ParkingDetailsModel model) async {
    final url = Uri.parse('http://');
    final response = await client.post(
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

  Future<List<ParkingDetailsModel>> fetchParkingSpots(
      DateTime startDate, DateTime endDate, double lat, double long) async {
    // final url = Uri.parse('http://');
    // final response = await client.get(url);
    // final List<dynamic> decoded = jsonDecode(response.body);
    // return decoded
    //     .map((e) => ParkingDetailsModel.fromJson(e as Map<String, dynamic>))
    //     .toList();
    return [];
  }
}
