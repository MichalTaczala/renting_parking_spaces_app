// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_parking_spot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateParkingSpotResponseModelImpl
    _$$CreateParkingSpotResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$CreateParkingSpotResponseModelImpl(
          message: json['message'] as String?,
          parking_spot: json['parking_spot'] as int?,
        );

Map<String, dynamic> _$$CreateParkingSpotResponseModelImplToJson(
        _$CreateParkingSpotResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'parking_spot': instance.parking_spot,
    };
