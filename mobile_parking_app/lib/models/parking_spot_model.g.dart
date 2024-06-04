// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_spot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingSpotModelImpl _$$ParkingSpotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParkingSpotModelImpl(
      spotId: json['spotId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toDouble(),
      length: (json['length'] as num?)?.toDouble(),
      internal: json['internal'] as bool?,
      easyAccess: json['easyAccess'] as bool?,
      security: json['security'] as bool?,
      charging: json['charging'] as bool?,
      ownerId: json['ownerId'] as String?,
      imagesUrls: (json['imagesUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      addressId: json['addressId'] as int?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String? ?? "USD",
    );

Map<String, dynamic> _$$ParkingSpotModelImplToJson(
        _$ParkingSpotModelImpl instance) =>
    <String, dynamic>{
      'spotId': instance.spotId,
      'name': instance.name,
      'description': instance.description,
      'height': instance.height,
      'width': instance.width,
      'length': instance.length,
      'internal': instance.internal,
      'easyAccess': instance.easyAccess,
      'security': instance.security,
      'charging': instance.charging,
      'ownerId': instance.ownerId,
      'imagesUrls': instance.imagesUrls,
      'addressId': instance.addressId,
      'address': instance.address,
      'price': instance.price,
      'currency': instance.currency,
    };
