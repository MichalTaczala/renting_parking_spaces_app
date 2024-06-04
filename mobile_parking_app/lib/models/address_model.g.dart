// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      addressId: json['addressId'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      street: json['street'] as String?,
      houseNo: json['houseNo'] as String?,
      postalCode: json['postalCode'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      district: json['district'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'lat': instance.lat,
      'long': instance.long,
      'street': instance.street,
      'houseNo': instance.houseNo,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'region': instance.region,
      'district': instance.district,
      'country': instance.country,
    };
