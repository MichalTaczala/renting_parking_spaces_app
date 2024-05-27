// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingDetailsModelImpl _$$ParkingDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ParkingDetailsModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String,
      location: json['location'] == null
          ? null
          : AddressModel.fromJson(json['location'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      rating: json['rating'] as String?,
      distance: json['distance'] as String?,
    );

Map<String, dynamic> _$$ParkingDetailsModelImplToJson(
        _$ParkingDetailsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
      'location': instance.location,
      'price': instance.price,
      'currency': instance.currency,
      'rating': instance.rating,
      'distance': instance.distance,
    };
