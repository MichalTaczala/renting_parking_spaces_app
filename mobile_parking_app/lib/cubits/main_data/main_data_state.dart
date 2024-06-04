import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';

part 'main_data_state.freezed.dart';

@freezed
class MainDataState with _$MainDataState {
  const factory MainDataState({
    LatLng? choosenLocationForGarage,
    String? choosenLocationForGarageName,
    DateTime? startDate,
    DateTime? endDate,
    //TODO change to object
    @Default([]) List<ParkingSpotModel> parkingSpots,
  }) = _MainDataState;
}
