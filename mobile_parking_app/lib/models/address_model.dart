import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  const factory AddressModel({
    int? addressId,
    required double? lat,
    required double? long,
    required String? street,
    required String? houseNo,
    required String? postalCode,
    required String? city,
    String? region,
    String? district,
    required String? country,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
