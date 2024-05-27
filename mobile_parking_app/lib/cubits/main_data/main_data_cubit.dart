import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  void setDateRangeAndFetchParkingSpots(PickerDateRange dateRange) {
    emit(
      state.copyWith(
        startDate: dateRange.startDate,
        endDate: dateRange.endDate,
      ),
    );
    if (state.choosenLocationForGarage != null) {
      _fetchParkingSpots();
    }
  }

  void setLocationAndFetchParkingSpots(LatLng location) async {
    final String name;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    final g = placemarks[0];
    name = "${location.latitude}, ${location.longitude}";
    emit(
      state.copyWith(
        choosenLocationForGarage: location,
        choosenLocationForGarageName: name,
      ),
    );
    if (state.startDate != null && state.endDate != null) {
      _fetchParkingSpots();
    }
  }

  void _fetchParkingSpots() async {
    final parkinSpots = await flaskRepository.fetchParkingSpots(
      state.startDate!,
      state.endDate!,
      state.choosenLocationForGarage!.latitude,
      state.choosenLocationForGarage!.longitude,
    );
    emit(
      state.copyWith(
        parkingSpots: parkinSpots,
      ),
    );
  }
}
