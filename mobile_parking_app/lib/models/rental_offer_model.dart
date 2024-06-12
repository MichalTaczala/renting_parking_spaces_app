import 'package:freezed_annotation/freezed_annotation.dart';

part 'rental_offer_model.freezed.dart';
part 'rental_offer_model.g.dart';

@freezed
class RentalOfferModel with _$RentalOfferModel {
  const factory RentalOfferModel({
    @JsonKey(name: "offer_id") required int offerId,
    @JsonKey(name: "auto_accept") required bool autoAccept,
    required double price,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "start_date") required DateTime startDate,
    @JsonKey(name: "end_date") required DateTime endDate,
    required String status,
    @JsonKey(name: "spot_id") required int spotId,
  }) = _RentalOfferModel;

  factory RentalOfferModel.fromJson(Map<String, dynamic> json) =>
      _$RentalOfferModelFromJson(json);
}
