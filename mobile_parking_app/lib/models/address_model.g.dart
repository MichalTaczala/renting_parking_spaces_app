// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      addressId: json['address_id'] as int?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      street: json['street'] as String?,
      houseNo: json['house_no'] as String?,
      postalCode: json['postal_code'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      district: json['district'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'address_id': instance.addressId,
      'lat': instance.lat,
      'long': instance.long,
      'street': instance.street,
      'house_no': instance.houseNo,
      'postal_code': instance.postalCode,
      'city': instance.city,
      'region': instance.region,
      'district': instance.district,
      'country': instance.country,
    };
