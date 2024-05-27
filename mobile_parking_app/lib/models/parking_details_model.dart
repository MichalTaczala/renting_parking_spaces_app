import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/address_model.dart';

part 'parking_details_model.freezed.dart';
part 'parking_details_model.g.dart';

@freezed
class ParkingDetailsModel with _$ParkingDetailsModel {
  const factory ParkingDetailsModel({
    String? id,
    required String name,
    String? phone,
    String? email,
    @JsonKey(includeFromJson: false, includeToJson: false) List<File>? images,
    required String description,
    AddressModel? location,
    required double price,
    required String currency,
    String? rating,
    String? distance,
  }) = _ParkingDetailsModel;

  factory ParkingDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingDetailsModelFromJson(json);
}
