import 'package:bloc/bloc.dart';
import 'package:mobile_parking_app/cubits/book_parking_spot/book_parking_spot_state.dart';
import 'package:mobile_parking_app/repositories/flask_repository.dart';

class BookParkingSpotCubit extends Cubit<BookParkingSpotState> {
  BookParkingSpotCubit(this._flaskRepository)
      : super(const BookParkingSpotState());
  final FlaskRepository _flaskRepository;
  void bookParkingSpot() async {
    await _flaskRepository.bookParkingSpot();
  }
}
