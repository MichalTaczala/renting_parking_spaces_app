import 'dart:convert';
import 'dart:io';

import 'package:mobile_parking_app/models/address_model.dart';
import 'package:mobile_parking_app/models/booking_model.dart';
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

//USERS
  Future<void> updateUserProfile(UserModel user) async {
    final url = Uri.parse('${FLASK_APP_URL}users/$firebaseUserId');
    final response = await flaskHttp.post(
      url,
      body: jsonEncode(
        user.toJson(),
      ),
    );
  }

//PARKING SPOTS

  Future<void> addParkingSpotNoImages(ParkingSpotModel model) async {
    final url = Uri.parse('$FLASK_APP_URL/parking_spots/create');
    final response = await flaskHttp.post(
      url,
      body: jsonEncode(model.toJson()),
    );
  }

  Future<void> addParkingSpotImages(List<File> images) async {
    final url = Uri.parse('$FLASK_APP_URL/parking_spots/create/images');
    final response = await flaskHttp.post(
      url,
      body: images,
    );
  }

  Future<List<ParkingSpotModel>> fetchParkingSpots(
      DateTime? startDate, DateTime? endDate, double? lat, double? long) async {
    final url = Uri.parse('$FLASK_APP_URL/parking_spots/all');
    final response = await flaskHttp.get(url);
    final List<dynamic> decoded = jsonDecode(response.body);
    // return decoded
    // .map((e) => ParkingSpotModel.fromJson(e as Map<String, dynamic>))
    // .toList();
    return [
      const ParkingSpotModel(
        address: AddressModel(
            lat: 14,
            long: 14,
            street: "street",
            houseNo: "houseNo",
            postalCode: "postalCode",
            city: "city",
            country: "country"),
        charging: false,
        currency: "USD",
        description: "description",
        easyAccess: false,
        height: 0.0,
        internal: false,
        length: 0.0,
        name: "name1",
        ownerId: "ownerId",
        price: 13.0,
        security: false,
        spotId: "0",
        width: 0.0,
        imagesUrls: [
          "https://dcblog.b-cdn.net/wp-content/uploads/2021/02/Full-form-of-URL-1-1024x824.jpg",
          "https://www.lifewire.com/thmb/LdUxE_d7gayEvXZ714s8mnl4OwY=/1301x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/ScreenShot2020-04-20at10.03.23AM-d55387c4422940be9a4f353182bd778c.jpg",
        ],
      ),
      const ParkingSpotModel(
        address: AddressModel(
            lat: 14,
            long: 14,
            street: "street",
            houseNo: "houseNo",
            postalCode: "postalCode",
            city: "city",
            country: "country"),
        charging: false,
        currency: "USD",
        description: "description",
        easyAccess: false,
        height: 0.0,
        internal: false,
        length: 0.0,
        name: "name2",
        ownerId: "ownerId",
        price: 12.0,
        security: false,
        spotId: "0",
        width: 0.0,
        imagesUrls: [
          "https://www.bestsheds.com.au/wp-content/uploads/2020/05/Double-garage-with-lean-to-002.jpg",
          "https://res.cloudinary.com/dj484tw6k/f_auto,q_auto,c_pad,b_white,w_712,h_712/v1694500438/1bdaf06c-c61b-4d70-a2e1-916902a52449.png",
        ],
      ),
    ];
  }

  Future<ParkingSpotModel> fetchParkingSpot(int spotId) async {
    final url = Uri.parse('$FLASK_APP_URL/parking_spots/$spotId');
    final response = await flaskHttp.get(url);
    final decoded = jsonDecode(response.body);
    // return ParkingSpotModel.fromJson(decoded as Map<String, dynamic>);
    return const ParkingSpotModel(
      address: AddressModel(
          lat: 14,
          long: 14,
          street: "street",
          houseNo: "houseNo",
          postalCode: "postalCode",
          city: "city",
          country: "country"),
      charging: false,
      currency: "USD",
      description: "description",
      easyAccess: false,
      height: 0.0,
      internal: false,
      length: 0.0,
      name: "name3",
      ownerId: "ownerId",
      price: 14.0,
      security: false,
      spotId: "0",
      width: 0.0,
      imagesUrls: [
        "https://dcblog.b-cdn.net/wp-content/uploads/2021/02/Full-form-of-URL-1-1024x824.jpg",
        "https://www.lifewire.com/thmb/LdUxE_d7gayEvXZ714s8mnl4OwY=/1301x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/ScreenShot2020-04-20at10.03.23AM-d55387c4422940be9a4f353182bd778c.jpg",
      ],
    );
  }

  Future<void> createBooking(BookingModel model) async {
    final url = Uri.parse('$FLASK_APP_URL/booking/create');
    await flaskHttp.post(
      url,
      body: jsonEncode(model.toJson()),
    );
  }
}
