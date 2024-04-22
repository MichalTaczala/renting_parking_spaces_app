import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_parking_app/cubits/payment_cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState());
}

