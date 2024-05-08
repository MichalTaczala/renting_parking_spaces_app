import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_parking_spot_state.freezed.dart';

@freezed
class AddParkingSpotState with _$AddParkingSpotState {
  const factory AddParkingSpotState({
    @Default("") String name,
    @Default("") String address,
    @Default("") double price,
    @Default("") String description,
    @Default([]) List<File> images,
  }) = _AddParkingSpotState;
}
