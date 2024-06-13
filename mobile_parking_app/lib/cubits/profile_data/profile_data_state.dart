import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_data_state.freezed.dart';

@freezed
class ProfileDataState with _$ProfileDataState {
  const factory ProfileDataState({
    String? name,
    String? surname,
    String? email,
    String? phone,
  }) = _ProfileDataState;
}
