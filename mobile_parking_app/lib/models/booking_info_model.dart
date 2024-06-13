import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';

part 'booking_info_model.freezed.dart';
part 'booking_info_model.g.dart';

@freezed
class BookingInfoModel with _$BookingInfoModel {
  const factory BookingInfoModel({
    @JsonKey(name: "booking_id") required int bookingId,
    @JsonKey(name: "booking_start") String? bookingStart,
    @JsonKey(name: "booking_end") String? bookingEnd,
    @JsonKey(name: "price_total") String? priceTotal,
    ParkingSpotModel? spot,
    @JsonKey(name: "user_id") int? userId,
  }) = _BookingInfoModel;

  factory BookingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BookingInfoModelFromJson(json);
}
