// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      bookingId: json['bookingId'] as int,
      bookingStart: DateTime.parse(json['bookingStart'] as String),
      bookingEnd: DateTime.parse(json['bookingEnd'] as String),
      status: json['status'] as String,
      priceTotal: (json['priceTotal'] as num).toDouble(),
      userId: json['userId'] as int,
      offerId: json['offerId'] as int,
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'bookingStart': instance.bookingStart.toIso8601String(),
      'bookingEnd': instance.bookingEnd.toIso8601String(),
      'status': instance.status,
      'priceTotal': instance.priceTotal,
      'userId': instance.userId,
      'offerId': instance.offerId,
    };
