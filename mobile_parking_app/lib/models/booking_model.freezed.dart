// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  int get bookingId => throw _privateConstructorUsedError;
  DateTime get bookingStart => throw _privateConstructorUsedError;
  DateTime get bookingEnd => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get priceTotal => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get offerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {int bookingId,
      DateTime bookingStart,
      DateTime bookingEnd,
      String status,
      double priceTotal,
      int userId,
      int offerId});
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingStart = null,
    Object? bookingEnd = null,
    Object? status = null,
    Object? priceTotal = null,
    Object? userId = null,
    Object? offerId = null,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStart: null == bookingStart
          ? _value.bookingStart
          : bookingStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookingEnd: null == bookingEnd
          ? _value.bookingEnd
          : bookingEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priceTotal: null == priceTotal
          ? _value.priceTotal
          : priceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
          _$BookingModelImpl value, $Res Function(_$BookingModelImpl) then) =
      __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookingId,
      DateTime bookingStart,
      DateTime bookingEnd,
      String status,
      double priceTotal,
      int userId,
      int offerId});
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
      _$BookingModelImpl _value, $Res Function(_$BookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? bookingStart = null,
    Object? bookingEnd = null,
    Object? status = null,
    Object? priceTotal = null,
    Object? userId = null,
    Object? offerId = null,
  }) {
    return _then(_$BookingModelImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStart: null == bookingStart
          ? _value.bookingStart
          : bookingStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookingEnd: null == bookingEnd
          ? _value.bookingEnd
          : bookingEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      priceTotal: null == priceTotal
          ? _value.priceTotal
          : priceTotal // ignore: cast_nullable_to_non_nullable
              as double,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  const _$BookingModelImpl(
      {required this.bookingId,
      required this.bookingStart,
      required this.bookingEnd,
      required this.status,
      required this.priceTotal,
      required this.userId,
      required this.offerId});

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  final int bookingId;
  @override
  final DateTime bookingStart;
  @override
  final DateTime bookingEnd;
  @override
  final String status;
  @override
  final double priceTotal;
  @override
  final int userId;
  @override
  final int offerId;

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, bookingStart: $bookingStart, bookingEnd: $bookingEnd, status: $status, priceTotal: $priceTotal, userId: $userId, offerId: $offerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.bookingStart, bookingStart) ||
                other.bookingStart == bookingStart) &&
            (identical(other.bookingEnd, bookingEnd) ||
                other.bookingEnd == bookingEnd) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priceTotal, priceTotal) ||
                other.priceTotal == priceTotal) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.offerId, offerId) || other.offerId == offerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookingId, bookingStart,
      bookingEnd, status, priceTotal, userId, offerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  const factory _BookingModel(
      {required final int bookingId,
      required final DateTime bookingStart,
      required final DateTime bookingEnd,
      required final String status,
      required final double priceTotal,
      required final int userId,
      required final int offerId}) = _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  int get bookingId;
  @override
  DateTime get bookingStart;
  @override
  DateTime get bookingEnd;
  @override
  String get status;
  @override
  double get priceTotal;
  @override
  int get userId;
  @override
  int get offerId;
  @override
  @JsonKey(ignore: true)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
