import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/address_model.dart';

part 'add_parking_spot_state.freezed.dart';

@freezed
class AddParkingSpotState with _$AddParkingSpotState {
  const factory AddParkingSpotState({
    String? name,
    String? placeId,
    AddressModel? address,
    double? price,
    @Default("") String description,
    @Default([]) List<File> imagesFiles,
    @Default([]) List<String> imagesUrls,
    double? widthSize,
    double? lengthSize,
    double? height,
    @Default(false) bool isInternal,
    @Default(false) bool isEasyAccess,
    @Default(false) bool isSecurity,
    @Default(false) bool isCharger,
    String? ownerId,
  }) = _AddParkingSpotState;
}
