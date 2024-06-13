// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingSpotModelImpl _$$ParkingSpotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParkingSpotModelImpl(
      spotId: json['spot_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      height: json['height'] as String?,
      width: json['width'] as String?,
      length: json['length'] as String?,
      internal: json['internal'] as bool?,
      distance: (json['distance'] as num?)?.toDouble(),
      easyAccess: json['easy_access'] as bool?,
      security: json['security'] as bool?,
      ownerId: json['owner_id'] as int?,
      charging: json['charging'] as bool?,
      imagesUrls: (json['image_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      addressId: json['address_id'] as int?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      price: json['price'] as String,
      currency: json['currency'] as String? ?? "USD",
    );

Map<String, dynamic> _$$ParkingSpotModelImplToJson(
        _$ParkingSpotModelImpl instance) =>
    <String, dynamic>{
      'spot_id': instance.spotId,
      'name': instance.name,
      'description': instance.description,
      'height': instance.height,
      'width': instance.width,
      'length': instance.length,
      'internal': instance.internal,
      'distance': instance.distance,
      'easy_access': instance.easyAccess,
      'security': instance.security,
      'owner_id': instance.ownerId,
      'charging': instance.charging,
      'image_urls': instance.imagesUrls,
      'address_id': instance.addressId,
      'address': instance.address,
      'price': instance.price,
      'currency': instance.currency,
    };
