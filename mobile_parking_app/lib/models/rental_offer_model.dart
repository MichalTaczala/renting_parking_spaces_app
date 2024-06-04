import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_offer_model.freezed.dart';
part 'rental_offer_model.g.dart';

@freezed
class RentalOfferModel with _$RentalOfferModel {
  const factory RentalOfferModel({
    required int offerId,
    required bool autoAccept,
    required double price,
    required DateTime createdAt,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
    required int spotId,
  }) = _RentalOfferModel;

  factory RentalOfferModel.fromJson(Map<String, dynamic> json) =>
      _$RentalOfferModelFromJson(json);
}
