import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/address_model.dart';

part 'parking_spot_model.freezed.dart';
part 'parking_spot_model.g.dart';

@freezed
class ParkingSpotModel with _$ParkingSpotModel {
  const factory ParkingSpotModel({
    @JsonKey(name: "spot_id") int? spotId,
    String? name,
    String? description,
    String? height,
    String? width,
    String? length,
    bool? internal,
    String? distance,
    @JsonKey(name: "easy_access") bool? easyAccess,
    bool? security,
    @JsonKey(name: "owner_id") int? ownerId,
    bool? charging,
    @JsonKey(name: "images_url") @Default([]) List<String> imagesUrls,
    @JsonKey(name: "address_id") int? addressId,
    AddressModel? address,
    required String price,
    @Default("USD") String currency,
  }) = _ParkingSpotModel;

  factory ParkingSpotModel.fromJson(Map<String, dynamic> json) =>
      _$ParkingSpotModelFromJson(json);
}
