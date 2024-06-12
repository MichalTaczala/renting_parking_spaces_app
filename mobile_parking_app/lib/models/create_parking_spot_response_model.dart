import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_parking_spot_response_model.freezed.dart';
part 'create_parking_spot_response_model.g.dart';

@freezed
class CreateParkingSpotResponseModel with _$CreateParkingSpotResponseModel {
  const factory CreateParkingSpotResponseModel({
    String? message,
    int? parking_spot,
  }) = _CreateParkingSpotResponseModel;

  factory CreateParkingSpotResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateParkingSpotResponseModelFromJson(json);
}
