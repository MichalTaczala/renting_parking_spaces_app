import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:mobile_parking_app/models/parking_details_model.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';

import 'add_parking_spot_state.dart';

class AddParkingSpotCubit extends Cubit<AddParkingSpotState> {
  AddParkingSpotCubit(this._flaskRepository)
      : super(const AddParkingSpotState());
  final FlaskRepository _flaskRepository;

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void addressChanged(String address) {
    emit(state.copyWith(address: address));
  }

  void priceChanged(double price) {
    emit(state.copyWith(price: price));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void imagesChanged(List<File> images) {
    emit(state.copyWith(images: images));
  }

  Future<void> addParkingSpot() async {
    await Future.wait(
      [
        _flaskRepository.addParkingSpot(
          ParkingDetailsModel(
            name: state.name,
            address: state.address,
            price: state.price,
            description: state.description,
            // images: state.images,
            currency: 'USD',
          ),
        ),
        _flaskRepository.addParkingSpotImages(state.images),
      ],
    );
  }
}
