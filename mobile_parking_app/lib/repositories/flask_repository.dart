import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobile_parking_app/models/booking_info_model.dart';
import 'package:mobile_parking_app/models/create_parking_spot_response_model.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';
import 'package:mobile_parking_app/models/user_model.dart';
import 'package:mobile_parking_app/utils/constants.dart';
import 'package:mobile_parking_app/utils/flask_http.dart';

class FlaskRepository {
  String? firebaseUserId;
  FlaskHttp flaskHttp = FlaskHttp();

  void addUserId(String userId) {
    firebaseUserId = userId;
    flaskHttp.addUserId(userId);
  }

  //DONE
  Future<void> updateUserProfile(UserModel user) async {
    final idInDb = await getUserIdFromFirebaseToken();

    if (idInDb == null) {
      final newUser = user.copyWith(
        firebaseToken: firebaseUserId!,
        phone: user.phone ?? "666 555 332",
        phonePrefix: user.phonePrefix ?? "123",
        type: "regular",
        username: "${user.firstName} ${user.lastName} $idInDb",
      );
      final url = Uri.parse('$FLASK_APP_URL/users/create');
      final encoded = jsonEncode(newUser.toJson());
      final response = await flaskHttp
          .post(url, body: jsonEncode(newUser.toJson()), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      return;
    }
    final url = Uri.parse('$FLASK_APP_URL/users/$idInDb');
    final userJson = user.toJson();
    userJson.removeWhere((key, value) => value == null);

    final responsePut = await flaskHttp.put(
      url,
      body: jsonEncode(
        userJson,
      ),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    return;
  }

  //DONE
  Future<int?> getUserIdFromFirebaseToken() async {
    final url = Uri.parse('$FLASK_APP_URL/users/id');
    final Map<String, String> queryParams = {};
    queryParams['firebase_token'] = firebaseUserId!;
    // queryParams['endDate'] = DateFormat('yyyy-MM-dd').format(endDate);
    // }
    // if (lat != null && long != null) {
    // queryParams['lat'] = lat.toString();
    // queryParams['long'] = long.toString();
    // }
    final Uri uri = url.replace(queryParameters: queryParams);
    // final response = await http.get(url, body: {'firebase_id': firebaseUserId});
    // final request = http.Request('GET', url)
    //   ..headers.addAll(
    //     {
    //       HttpHeaders.contentTypeHeader: 'application/json',
    //     },
    //   )
    //   ..body = jsonEncode({'firebase_token': firebaseToken});
    // final streamedRes = await request.send();
    // final http.Response response = await http.Response.fromStream(streamedRes);
    final response = await http.get(uri);
    return response.statusCode == 200
        ? jsonDecode(response.body)["user_id"]
        : null;
  }

//PARKING SPOTS

  Future<CreateParkingSpotResponseModel> addParkingSpotNoImages(
      ParkingSpotModel model) async {
    final id = await getUserIdFromFirebaseToken();

    final url = Uri.parse('$FLASK_APP_URL/parking_spots/create');
    final response = await flaskHttp.post(
      url,
      body: jsonEncode((model.copyWith(ownerId: id)).toJson()),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    final responseModel =
        CreateParkingSpotResponseModel.fromJson(jsonDecode(response.body));
    return responseModel;
  }

  Future<void> addParkingSpotImages(List<File> images, int parkingId) async {
    final url =
        Uri.parse('$FLASK_APP_URL/parking_spots/$parkingId/upload_images');

    // Create a multipart request
    var request = http.MultipartRequest('POST', url);

    // Add files to the request
    for (int i = 0; i < images.length; i++) {
      var imageFile = images[i];
      request.files
          .add(await http.MultipartFile.fromPath('image$i', imageFile.path));
    }

    try {
      // Send the request
      var response = await request.send();

      // Check the response status
      if (response.statusCode == 200) {
        print('Images uploaded successfully');
      } else {
        print('Failed to upload images. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading images: $e');
    }
  }

  Future<List<ParkingSpotModel>> fetchParkingSpots(
      DateTime? startDate, DateTime? endDate, double? lat, double? long) async {
    final url = Uri.parse('$FLASK_APP_URL/parking_spots/all');
    final Map<String, String> queryParams = {};
    if (startDate != null && endDate != null) {
      queryParams['startDate'] = DateFormat('yyyy-MM-dd').format(startDate);
      queryParams['endDate'] = DateFormat('yyyy-MM-dd').format(endDate);
    }
    if (lat != null && long != null) {
      queryParams['lat'] = lat.toString();
      queryParams['long'] = long.toString();
    }
    final Uri uri = url.replace(queryParameters: queryParams);
    final response = await flaskHttp.get(uri);
    final List<dynamic> decoded = jsonDecode(response.body);
    final parkingSpots = decoded.map((e) {
      return ParkingSpotModel.fromJson(e as Map<String, dynamic>);
    }).toList();
    return parkingSpots;
  }

  Future<List<ParkingSpotModel>> fetchUsersParkingSpots() async {
    final id = await getUserIdFromFirebaseToken();
    final url = Uri.parse('$FLASK_APP_URL/users/$id/parking_spots');
    final response = await flaskHttp.get(url);
    final List<dynamic> decoded = jsonDecode(response.body);
    final parkingSpots = decoded.map((e) {
      return ParkingSpotModel.fromJson(e as Map<String, dynamic>);
    }).toList();
    return parkingSpots;
  }

  Future<List<BookingInfoModel>> fetchUsersBookings() async {
    final id = await getUserIdFromFirebaseToken();
    final url = Uri.parse('$FLASK_APP_URL/users/$id/bookings');
    final response = await flaskHttp.get(url);
    final List<dynamic> decoded = jsonDecode(response.body);
    final bookings = decoded.map((e) {
      return BookingInfoModel.fromJson(e as Map<String, dynamic>);
    }).toList();
    return bookings;
  }

  Future<void> bookParkingSpot(
      DateTime from, DateTime to, ParkingSpotModel parkingSpotModel) async {
    final id = await getUserIdFromFirebaseToken();
    final url = Uri.parse('$FLASK_APP_URL/booking/create');
    final toSend = {
      "booking_start": from.toIso8601String(),
      "booking_end": to.toIso8601String(),
      "status": "confirmed",
      "price_total": (double.parse(parkingSpotModel.price) *
              ((from.difference(to).inDays).abs() + 1))
          .toString(),
      "user_id": id,
      "offer_id": parkingSpotModel.spotId,
    };
    final response = await flaskHttp.post(
      url,
      body: jsonEncode(
        toSend,
      ),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (response.statusCode != 200) {
      print('Failed to book parking spot');
    } else {
      print('Parking spot booked');
    }
    print(response);
  }

  Future<UserModel> getUser() async {
    final id = await getUserIdFromFirebaseToken();
    final url = Uri.parse('$FLASK_APP_URL/users/$id');
    final response = await flaskHttp.get(url);
    final user = UserModel.fromJson(jsonDecode(response.body));
    return user;
  }
}
