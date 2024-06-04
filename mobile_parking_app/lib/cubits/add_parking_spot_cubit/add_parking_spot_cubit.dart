import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:mobile_parking_app/models/parking_spot_model.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';
import 'package:mobile_parking_app/repositories/google_maps_repository.dart';

import 'add_parking_spot_state.dart';

class AddParkingSpotCubit extends Cubit<AddParkingSpotState> {
  AddParkingSpotCubit(this._flaskRepository, this._googleMapsRepository)
      : super(const AddParkingSpotState());

  final FlaskRepository _flaskRepository;
  final GoogleMapsRepository _googleMapsRepository;

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void addressChanged(String placeId) async {
    final address = await _googleMapsRepository.getAddressFromPlaceId(placeId);
    emit(state.copyWith(address: address));
  }

  void priceChanged(double? price) {
    emit(state.copyWith(price: price));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void imagesChanged(List<File> images) {
    emit(state.copyWith(imagesFiles: images));
  }

  Future<void> addParkingSpot() async {
    final model = ParkingSpotModel(
      name: state.name!,
      description: state.description,
      width: state.widthSize,
      length: state.lengthSize,
      height: state.height,
      internal: state.isInternal,
      easyAccess: state.isEasyAccess,
      security: state.isSecurity,
      charging: state.isCharger,
      address: state.address,
      price: state.price!,
    );
    final response = await _flaskRepository.addParkingSpotNoImages(model);
    final responseImages =
        await _flaskRepository.addParkingSpotImages(state.imagesFiles);
  }

  void widthChanged(double? width) {
    emit(state.copyWith(widthSize: width));
  }

  void lengthChanged(double? length) {
    emit(state.copyWith(lengthSize: length));
  }

  void heightChanged(double? height) {
    emit(state.copyWith(height: height));
  }

  void changeIsSecured(bool? isSecured) {
    emit(state.copyWith(isSecurity: isSecured ?? false));
  }

  void changeIsCharger(bool? value) {
    emit(state.copyWith(isCharger: value ?? false));
  }

  void changeIsEasyAccess(bool? value) {
    emit(state.copyWith(isEasyAccess: value ?? false));
  }

  void changeIsInternal(bool? value) {
    emit(state.copyWith(isInternal: value ?? false));
  }
}
