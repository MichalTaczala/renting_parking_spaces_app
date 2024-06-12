import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_parking_app/cubits/main_data/main_data_state.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/repositories/google_maps_repository.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainDataCubit extends Cubit<MainDataState> {
  final FlaskRepository flaskRepository;
  final GoogleMapsRepository googleMapsRepository;
  MainDataCubit(
      {required this.flaskRepository, required this.googleMapsRepository})
      : super(const MainDataState());

  void init() {
    _fetchParkingSpots();
  }

  void setDateRangeAndFetchParkingSpots(PickerDateRange dateRange) {
    emit(
      state.copyWith(
        startDate: dateRange.startDate,
        endDate: dateRange.endDate,
      ),
    );
    _fetchParkingSpots();
  }

  void setLocationAndFetchParkingSpots(LatLng location) async {
    final String name;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    final g = placemarks[0];
    String host = 'https://maps.google.com/maps/api/geocode/json';
    final url =
        '$host?key=${dotenv.get("GOOGLE_MAPS_API_KEY")}&language=en&latlng=${location.latitude},${location.longitude}';

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      String formattedAddress = data["results"][0]["formatted_address"];
      name = formattedAddress;
    } else {
      name = "${location.latitude} ${location.longitude}";
    }

    emit(
      state.copyWith(
        choosenLocationForGarage: location,
        choosenLocationForGarageName: name,
      ),
    );
    _fetchParkingSpots();
  }

  void _fetchParkingSpots() async {
    final parkinSpots = await flaskRepository.fetchParkingSpots(
      state.startDate,
      state.endDate,
      state.choosenLocationForGarage?.latitude,
      state.choosenLocationForGarage?.longitude,
    );
    emit(
      state.copyWith(
        parkingSpots: parkinSpots,
      ),
    );
  }
}
