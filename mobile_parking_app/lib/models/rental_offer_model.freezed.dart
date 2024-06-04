// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RentalOfferModel _$RentalOfferModelFromJson(Map<String, dynamic> json) {
  return _RentalOfferModel.fromJson(json);
}

/// @nodoc
mixin _$RentalOfferModel {
  int get offerId => throw _privateConstructorUsedError;
  bool get autoAccept => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get spotId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RentalOfferModelCopyWith<RentalOfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalOfferModelCopyWith<$Res> {
  factory $RentalOfferModelCopyWith(
          RentalOfferModel value, $Res Function(RentalOfferModel) then) =
      _$RentalOfferModelCopyWithImpl<$Res, RentalOfferModel>;
  @useResult
  $Res call(
      {int offerId,
      bool autoAccept,
      double price,
      DateTime createdAt,
      DateTime startDate,
      DateTime endDate,
      String status,
      int spotId});
}

/// @nodoc
class _$RentalOfferModelCopyWithImpl<$Res, $Val extends RentalOfferModel>
    implements $RentalOfferModelCopyWith<$Res> {
  _$RentalOfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? autoAccept = null,
    Object? price = null,
    Object? createdAt = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? spotId = null,
  }) {
    return _then(_value.copyWith(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      autoAccept: null == autoAccept
          ? _value.autoAccept
          : autoAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      spotId: null == spotId
          ? _value.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentalOfferModelImplCopyWith<$Res>
    implements $RentalOfferModelCopyWith<$Res> {
  factory _$$RentalOfferModelImplCopyWith(_$RentalOfferModelImpl value,
          $Res Function(_$RentalOfferModelImpl) then) =
      __$$RentalOfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int offerId,
      bool autoAccept,
      double price,
      DateTime createdAt,
      DateTime startDate,
      DateTime endDate,
      String status,
      int spotId});
}

/// @nodoc
class __$$RentalOfferModelImplCopyWithImpl<$Res>
    extends _$RentalOfferModelCopyWithImpl<$Res, _$RentalOfferModelImpl>
    implements _$$RentalOfferModelImplCopyWith<$Res> {
  __$$RentalOfferModelImplCopyWithImpl(_$RentalOfferModelImpl _value,
      $Res Function(_$RentalOfferModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? autoAccept = null,
    Object? price = null,
    Object? createdAt = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? spotId = null,
  }) {
    return _then(_$RentalOfferModelImpl(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      autoAccept: null == autoAccept
          ? _value.autoAccept
          : autoAccept // ignore: cast_nullable_to_non_nullable
              as bool,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      spotId: null == spotId
          ? _value.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RentalOfferModelImpl implements _RentalOfferModel {
  const _$RentalOfferModelImpl(
      {required this.offerId,
      required this.autoAccept,
      required this.price,
      required this.createdAt,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.spotId});

  factory _$RentalOfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RentalOfferModelImplFromJson(json);

  @override
  final int offerId;
  @override
  final bool autoAccept;
  @override
  final double price;
  @override
  final DateTime createdAt;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String status;
  @override
  final int spotId;

  @override
  String toString() {
    return 'RentalOfferModel(offerId: $offerId, autoAccept: $autoAccept, price: $price, createdAt: $createdAt, startDate: $startDate, endDate: $endDate, status: $status, spotId: $spotId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalOfferModelImpl &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.autoAccept, autoAccept) ||
                other.autoAccept == autoAccept) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.spotId, spotId) || other.spotId == spotId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, offerId, autoAccept, price,
      createdAt, startDate, endDate, status, spotId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalOfferModelImplCopyWith<_$RentalOfferModelImpl> get copyWith =>
      __$$RentalOfferModelImplCopyWithImpl<_$RentalOfferModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RentalOfferModelImplToJson(
      this,
    );
  }
}

abstract class _RentalOfferModel implements RentalOfferModel {
  const factory _RentalOfferModel(
      {required final int offerId,
      required final bool autoAccept,
      required final double price,
      required final DateTime createdAt,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String status,
      required final int spotId}) = _$RentalOfferModelImpl;

  factory _RentalOfferModel.fromJson(Map<String, dynamic> json) =
      _$RentalOfferModelImpl.fromJson;

  @override
  int get offerId;
  @override
  bool get autoAccept;
  @override
  double get price;
  @override
  DateTime get createdAt;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get status;
  @override
  int get spotId;
  @override
  @JsonKey(ignore: true)
  _$$RentalOfferModelImplCopyWith<_$RentalOfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
