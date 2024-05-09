import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_parking_app/cubits/main_data/main_data_state.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainDataCubit extends Cubit<MainDataState> {
  MainDataCubit() : super(const MainDataState());

  void setDateRange(PickerDateRange dateRange) {
    emit(
      state.copyWith(
        startDate: dateRange.startDate,
        endDate: dateRange.endDate,
      ),
    );
  }

  void setLocation(LatLng location) {
    emit(
      state.copyWith(
        choosenLocationForGarage: location,
      ),
    );
  }
}
