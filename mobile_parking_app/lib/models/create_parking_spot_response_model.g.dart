// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_parking_spot_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateParkingSpotResponseModelImpl
    _$$CreateParkingSpotResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$CreateParkingSpotResponseModelImpl(
          message: json['message'] as String?,
          parkingId: json['parking_id'] as int?,
        );

Map<String, dynamic> _$$CreateParkingSpotResponseModelImplToJson(
        _$CreateParkingSpotResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'parking_id': instance.parkingId,
    };
