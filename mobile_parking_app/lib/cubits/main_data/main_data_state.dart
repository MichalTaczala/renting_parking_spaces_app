import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'main_data_state.freezed.dart';

@freezed
class MainDataState with _$MainDataState {
  const factory MainDataState({
    LatLng? choosenLocationForGarage,
    DateTime? startDate,
    DateTime? endDate,
  }) = _MainDataState;
}
