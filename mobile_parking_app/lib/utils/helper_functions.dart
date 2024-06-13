import 'package:mobile_parking_app/models/address_model.dart';

String getReadableAddress(AddressModel? address) {
  return "${address?.street} ${address?.houseNo}, ${address?.country}";
}
