// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingInfoModelImpl _$$BookingInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingInfoModelImpl(
      bookingId: json['booking_id'] as int,
      bookingStart: json['booking_start'] as String?,
      bookingEnd: json['booking_end'] as String?,
      priceTotal: json['price_total'] as String?,
      spot: json['spot'] == null
          ? null
          : ParkingSpotModel.fromJson(json['spot'] as Map<String, dynamic>),
      userId: json['user_id'] as int?,
    );

Map<String, dynamic> _$$BookingInfoModelImplToJson(
        _$BookingInfoModelImpl instance) =>
    <String, dynamic>{
      'booking_id': instance.bookingId,
      'booking_start': instance.bookingStart,
      'booking_end': instance.bookingEnd,
      'price_total': instance.priceTotal,
      'spot': instance.spot,
      'user_id': instance.userId,
    };
