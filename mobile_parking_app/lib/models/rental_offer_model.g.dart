// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalOfferModelImpl _$$RentalOfferModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalOfferModelImpl(
      offerId: json['offer_id'] as int,
      autoAccept: json['auto_accept'] as bool,
      price: (json['price'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      status: json['status'] as String,
      spotId: json['spot_id'] as int,
    );

Map<String, dynamic> _$$RentalOfferModelImplToJson(
        _$RentalOfferModelImpl instance) =>
    <String, dynamic>{
      'offer_id': instance.offerId,
      'auto_accept': instance.autoAccept,
      'price': instance.price,
      'created_at': instance.createdAt.toIso8601String(),
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'status': instance.status,
      'spot_id': instance.spotId,
    };
