// import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_parking_app/models/rental_offer_model.dart';

part 'book_parking_spot_state.freezed.dart';

// enum AuthenticationStatus { authenticated, unauthenticated }
@freezed
class BookParkingSpotState with _$BookParkingSpotState {
  const factory BookParkingSpotState({
    RentalOfferModel? rentalOffer,
    // @Default(AuthenticationStatus.unauthenticated) AuthenticationStatus status,
  }) = _BookParkingSpotState;
}
