import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    @JsonKey(name: "address_id") int? addressId,
    required String? lat,
    required String? long,
    @Default(".") String street,
    @JsonKey(name: "house_no") required String? houseNo,
    @JsonKey(name: "postal_code") required String? postalCode,
    @Default(".") String? city,
    @Default(".") String region,
    @Default(".") String district,
    required String? country,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
