import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/address_model.dart';

part 'add_parking_spot_state.freezed.dart';

@freezed
class AddParkingSpotState with _$AddParkingSpotState {
  const factory AddParkingSpotState({
    @Default("") String name,
    String? placeId,
    AddressModel? address,
    @Default(0) double price,
    @Default("") String description,
    @Default([]) List<File> images,
  }) = _AddParkingSpotState;
}
