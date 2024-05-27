// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainDataState {
  LatLng? get choosenLocationForGarage => throw _privateConstructorUsedError;
  String? get choosenLocationForGarageName =>
      throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate =>
      throw _privateConstructorUsedError; //TODO change to object
  List<dynamic> get parkingSpots => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainDataStateCopyWith<MainDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainDataStateCopyWith<$Res> {
  factory $MainDataStateCopyWith(
          MainDataState value, $Res Function(MainDataState) then) =
      _$MainDataStateCopyWithImpl<$Res, MainDataState>;
  @useResult
  $Res call(
      {LatLng? choosenLocationForGarage,
      String? choosenLocationForGarageName,
      DateTime? startDate,
      DateTime? endDate,
      List<dynamic> parkingSpots});
}

/// @nodoc
class _$MainDataStateCopyWithImpl<$Res, $Val extends MainDataState>
    implements $MainDataStateCopyWith<$Res> {
  _$MainDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choosenLocationForGarage = freezed,
    Object? choosenLocationForGarageName = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? parkingSpots = null,
  }) {
    return _then(_value.copyWith(
      choosenLocationForGarage: freezed == choosenLocationForGarage
          ? _value.choosenLocationForGarage
          : choosenLocationForGarage // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      choosenLocationForGarageName: freezed == choosenLocationForGarageName
          ? _value.choosenLocationForGarageName
          : choosenLocationForGarageName // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parkingSpots: null == parkingSpots
          ? _value.parkingSpots
          : parkingSpots // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainDataStateImplCopyWith<$Res>
    implements $MainDataStateCopyWith<$Res> {
  factory _$$MainDataStateImplCopyWith(
          _$MainDataStateImpl value, $Res Function(_$MainDataStateImpl) then) =
      __$$MainDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LatLng? choosenLocationForGarage,
      String? choosenLocationForGarageName,
      DateTime? startDate,
      DateTime? endDate,
      List<dynamic> parkingSpots});
}

/// @nodoc
class __$$MainDataStateImplCopyWithImpl<$Res>
    extends _$MainDataStateCopyWithImpl<$Res, _$MainDataStateImpl>
    implements _$$MainDataStateImplCopyWith<$Res> {
  __$$MainDataStateImplCopyWithImpl(
      _$MainDataStateImpl _value, $Res Function(_$MainDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choosenLocationForGarage = freezed,
    Object? choosenLocationForGarageName = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? parkingSpots = null,
  }) {
    return _then(_$MainDataStateImpl(
      choosenLocationForGarage: freezed == choosenLocationForGarage
          ? _value.choosenLocationForGarage
          : choosenLocationForGarage // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      choosenLocationForGarageName: freezed == choosenLocationForGarageName
          ? _value.choosenLocationForGarageName
          : choosenLocationForGarageName // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parkingSpots: null == parkingSpots
          ? _value._parkingSpots
          : parkingSpots // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$MainDataStateImpl implements _MainDataState {
  const _$MainDataStateImpl(
      {this.choosenLocationForGarage,
      this.choosenLocationForGarageName,
      this.startDate,
      this.endDate,
      final List<dynamic> parkingSpots = const []})
      : _parkingSpots = parkingSpots;

  @override
  final LatLng? choosenLocationForGarage;
  @override
  final String? choosenLocationForGarageName;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
//TODO change to object
  final List<dynamic> _parkingSpots;
//TODO change to object
  @override
  @JsonKey()
  List<dynamic> get parkingSpots {
    if (_parkingSpots is EqualUnmodifiableListView) return _parkingSpots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parkingSpots);
  }

  @override
  String toString() {
    return 'MainDataState(choosenLocationForGarage: $choosenLocationForGarage, choosenLocationForGarageName: $choosenLocationForGarageName, startDate: $startDate, endDate: $endDate, parkingSpots: $parkingSpots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainDataStateImpl &&
            (identical(
                    other.choosenLocationForGarage, choosenLocationForGarage) ||
                other.choosenLocationForGarage == choosenLocationForGarage) &&
            (identical(other.choosenLocationForGarageName,
                    choosenLocationForGarageName) ||
                other.choosenLocationForGarageName ==
                    choosenLocationForGarageName) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._parkingSpots, _parkingSpots));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      choosenLocationForGarage,
      choosenLocationForGarageName,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_parkingSpots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainDataStateImplCopyWith<_$MainDataStateImpl> get copyWith =>
      __$$MainDataStateImplCopyWithImpl<_$MainDataStateImpl>(this, _$identity);
}

abstract class _MainDataState implements MainDataState {
  const factory _MainDataState(
      {final LatLng? choosenLocationForGarage,
      final String? choosenLocationForGarageName,
      final DateTime? startDate,
      final DateTime? endDate,
      final List<dynamic> parkingSpots}) = _$MainDataStateImpl;

  @override
  LatLng? get choosenLocationForGarage;
  @override
  String? get choosenLocationForGarageName;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override //TODO change to object
  List<dynamic> get parkingSpots;
  @override
  @JsonKey(ignore: true)
  _$$MainDataStateImplCopyWith<_$MainDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
