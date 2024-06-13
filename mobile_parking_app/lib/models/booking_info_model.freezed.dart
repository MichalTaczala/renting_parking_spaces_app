// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingInfoModel _$BookingInfoModelFromJson(Map<String, dynamic> json) {
  return _BookingInfoModel.fromJson(json);
}

/// @nodoc
mixin _$BookingInfoModel {
  @JsonKey(name: "booking_id")
  int get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: "booking_start")
  String? get bookingStart => throw _privateConstructorUsedError;
  @JsonKey(name: "booking_end")
  String? get bookingEnd => throw _privateConstructorUsedError;
  @JsonKey(name: "price_total")
  String? get priceTotal => throw _privateConstructorUsedError;
  ParkingSpotModel? get spot => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  int? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingInfoModelCopyWith<BookingInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingInfoModelCopyWith<$Res> {
  factory $BookingInfoModelCopyWith(
          BookingInfoModel value, $Res Function(BookingInfoModel) then) =
      _$BookingInfoModelCopyWithImpl<$Res, BookingInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "booking_id") int bookingId,
      @JsonKey(name: "booking_start") String? bookingStart,
      @JsonKey(name: "booking_end") String? bookingEnd,
      @JsonKey(name: "price_total") String? priceTotal,
      ParkingSpotModel? spot,
      @JsonKey(name: "user_id") int? userId});

  $ParkingSpotModelCopyWith<$Res>? get spot;
}

/// @nodoc
class _$BookingInfoModelCopyWithImpl<$Res, $Val extends BookingInfoModel>
    implements $BookingInfoModelCopyWith<$Res> {
  _$BookingInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingStart = freezed,
    Object? bookingEnd = freezed,
    Object? priceTotal = freezed,
    Object? spot = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStart: freezed == bookingStart
          ? _value.bookingStart
          : bookingStart // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingEnd: freezed == bookingEnd
          ? _value.bookingEnd
          : bookingEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      priceTotal: freezed == priceTotal
          ? _value.priceTotal
          : priceTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      spot: freezed == spot
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as ParkingSpotModel?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParkingSpotModelCopyWith<$Res>? get spot {
    if (_value.spot == null) {
      return null;
    }

    return $ParkingSpotModelCopyWith<$Res>(_value.spot!, (value) {
      return _then(_value.copyWith(spot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingInfoModelImplCopyWith<$Res>
    implements $BookingInfoModelCopyWith<$Res> {
  factory _$$BookingInfoModelImplCopyWith(_$BookingInfoModelImpl value,
          $Res Function(_$BookingInfoModelImpl) then) =
      __$$BookingInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "booking_id") int bookingId,
      @JsonKey(name: "booking_start") String? bookingStart,
      @JsonKey(name: "booking_end") String? bookingEnd,
      @JsonKey(name: "price_total") String? priceTotal,
      ParkingSpotModel? spot,
      @JsonKey(name: "user_id") int? userId});

  @override
  $ParkingSpotModelCopyWith<$Res>? get spot;
}

/// @nodoc
class __$$BookingInfoModelImplCopyWithImpl<$Res>
    extends _$BookingInfoModelCopyWithImpl<$Res, _$BookingInfoModelImpl>
    implements _$$BookingInfoModelImplCopyWith<$Res> {
  __$$BookingInfoModelImplCopyWithImpl(_$BookingInfoModelImpl _value,
      $Res Function(_$BookingInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingStart = freezed,
    Object? bookingEnd = freezed,
    Object? priceTotal = freezed,
    Object? spot = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$BookingInfoModelImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStart: freezed == bookingStart
          ? _value.bookingStart
          : bookingStart // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingEnd: freezed == bookingEnd
          ? _value.bookingEnd
          : bookingEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      priceTotal: freezed == priceTotal
          ? _value.priceTotal
          : priceTotal // ignore: cast_nullable_to_non_nullable
              as String?,
      spot: freezed == spot
          ? _value.spot
          : spot // ignore: cast_nullable_to_non_nullable
              as ParkingSpotModel?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingInfoModelImpl implements _BookingInfoModel {
  const _$BookingInfoModelImpl(
      {@JsonKey(name: "booking_id") required this.bookingId,
      @JsonKey(name: "booking_start") this.bookingStart,
      @JsonKey(name: "booking_end") this.bookingEnd,
      @JsonKey(name: "price_total") this.priceTotal,
      this.spot,
      @JsonKey(name: "user_id") this.userId});

  factory _$BookingInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingInfoModelImplFromJson(json);

  @override
  @JsonKey(name: "booking_id")
  final int bookingId;
  @override
  @JsonKey(name: "booking_start")
  final String? bookingStart;
  @override
  @JsonKey(name: "booking_end")
  final String? bookingEnd;
  @override
  @JsonKey(name: "price_total")
  final String? priceTotal;
  @override
  final ParkingSpotModel? spot;
  @override
  @JsonKey(name: "user_id")
  final int? userId;

  @override
  String toString() {
    return 'BookingInfoModel(bookingId: $bookingId, bookingStart: $bookingStart, bookingEnd: $bookingEnd, priceTotal: $priceTotal, spot: $spot, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingInfoModelImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.bookingStart, bookingStart) ||
                other.bookingStart == bookingStart) &&
            (identical(other.bookingEnd, bookingEnd) ||
                other.bookingEnd == bookingEnd) &&
            (identical(other.priceTotal, priceTotal) ||
                other.priceTotal == priceTotal) &&
            (identical(other.spot, spot) || other.spot == spot) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookingId, bookingStart,
      bookingEnd, priceTotal, spot, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingInfoModelImplCopyWith<_$BookingInfoModelImpl> get copyWith =>
      __$$BookingInfoModelImplCopyWithImpl<_$BookingInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingInfoModelImplToJson(
      this,
    );
  }
}

abstract class _BookingInfoModel implements BookingInfoModel {
  const factory _BookingInfoModel(
      {@JsonKey(name: "booking_id") required final int bookingId,
      @JsonKey(name: "booking_start") final String? bookingStart,
      @JsonKey(name: "booking_end") final String? bookingEnd,
      @JsonKey(name: "price_total") final String? priceTotal,
      final ParkingSpotModel? spot,
      @JsonKey(name: "user_id") final int? userId}) = _$BookingInfoModelImpl;

  factory _BookingInfoModel.fromJson(Map<String, dynamic> json) =
      _$BookingInfoModelImpl.fromJson;

  @override
  @JsonKey(name: "booking_id")
  int get bookingId;
  @override
  @JsonKey(name: "booking_start")
  String? get bookingStart;
  @override
  @JsonKey(name: "booking_end")
  String? get bookingEnd;
  @override
  @JsonKey(name: "price_total")
  String? get priceTotal;
  @override
  ParkingSpotModel? get spot;
  @override
  @JsonKey(name: "user_id")
  int? get userId;
  @override
  @JsonKey(ignore: true)
  _$$BookingInfoModelImplCopyWith<_$BookingInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
