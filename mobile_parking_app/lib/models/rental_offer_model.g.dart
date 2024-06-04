// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rental_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RentalOfferModelImpl _$$RentalOfferModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RentalOfferModelImpl(
      offerId: json['offerId'] as int,
      autoAccept: json['autoAccept'] as bool,
      price: (json['price'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: json['status'] as String,
      spotId: json['spotId'] as int,
    );

Map<String, dynamic> _$$RentalOfferModelImplToJson(
        _$RentalOfferModelImpl instance) =>
    <String, dynamic>{
      'offerId': instance.offerId,
      'autoAccept': instance.autoAccept,
      'price': instance.price,
      'createdAt': instance.createdAt.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': instance.status,
      'spotId': instance.spotId,
    };
