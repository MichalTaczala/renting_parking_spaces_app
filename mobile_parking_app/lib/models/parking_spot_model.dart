import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/address_model.dart';

part 'parking_spot_model.freezed.dart';
part 'parking_spot_model.g.dart';

@freezed
class ParkingSpotModel with _$ParkingSpotModel {
  const factory ParkingSpotModel({
    String? spotId,
    String? name,
    String? description,
    double? height,
    double? width,
    double? length,
    bool? internal,
    bool? easyAccess,
    bool? security,
    bool? charging,
    String? ownerId,
    @Default([]) List<String> imagesUrls,
    int? addressId,
    AddressModel? address,
    required double price,
    @Default("USD") String currency,
  }) = _ParkingSpotModel;

  factory ParkingSpotModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingSpotModelFromJson(json);
}
