// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_parking_spot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookParkingSpotState {
  RentalOfferModel? get rentalOffer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookParkingSpotStateCopyWith<BookParkingSpotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookParkingSpotStateCopyWith<$Res> {
  factory $BookParkingSpotStateCopyWith(BookParkingSpotState value,
          $Res Function(BookParkingSpotState) then) =
      _$BookParkingSpotStateCopyWithImpl<$Res, BookParkingSpotState>;
  @useResult
  $Res call({RentalOfferModel? rentalOffer});

  $RentalOfferModelCopyWith<$Res>? get rentalOffer;
}

/// @nodoc
class _$BookParkingSpotStateCopyWithImpl<$Res,
        $Val extends BookParkingSpotState>
    implements $BookParkingSpotStateCopyWith<$Res> {
  _$BookParkingSpotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalOffer = freezed,
  }) {
    return _then(_value.copyWith(
      rentalOffer: freezed == rentalOffer
          ? _value.rentalOffer
          : rentalOffer // ignore: cast_nullable_to_non_nullable
              as RentalOfferModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RentalOfferModelCopyWith<$Res>? get rentalOffer {
    if (_value.rentalOffer == null) {
      return null;
    }

    return $RentalOfferModelCopyWith<$Res>(_value.rentalOffer!, (value) {
      return _then(_value.copyWith(rentalOffer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookParkingSpotStateImplCopyWith<$Res>
    implements $BookParkingSpotStateCopyWith<$Res> {
  factory _$$BookParkingSpotStateImplCopyWith(_$BookParkingSpotStateImpl value,
          $Res Function(_$BookParkingSpotStateImpl) then) =
      __$$BookParkingSpotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RentalOfferModel? rentalOffer});

  @override
  $RentalOfferModelCopyWith<$Res>? get rentalOffer;
}

/// @nodoc
class __$$BookParkingSpotStateImplCopyWithImpl<$Res>
    extends _$BookParkingSpotStateCopyWithImpl<$Res, _$BookParkingSpotStateImpl>
    implements _$$BookParkingSpotStateImplCopyWith<$Res> {
  __$$BookParkingSpotStateImplCopyWithImpl(_$BookParkingSpotStateImpl _value,
      $Res Function(_$BookParkingSpotStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalOffer = freezed,
  }) {
    return _then(_$BookParkingSpotStateImpl(
      rentalOffer: freezed == rentalOffer
          ? _value.rentalOffer
          : rentalOffer // ignore: cast_nullable_to_non_nullable
              as RentalOfferModel?,
    ));
  }
}

/// @nodoc

class _$BookParkingSpotStateImpl implements _BookParkingSpotState {
  const _$BookParkingSpotStateImpl({this.rentalOffer});

  @override
  final RentalOfferModel? rentalOffer;

  @override
  String toString() {
    return 'BookParkingSpotState(rentalOffer: $rentalOffer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookParkingSpotStateImpl &&
            (identical(other.rentalOffer, rentalOffer) ||
                other.rentalOffer == rentalOffer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rentalOffer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookParkingSpotStateImplCopyWith<_$BookParkingSpotStateImpl>
      get copyWith =>
          __$$BookParkingSpotStateImplCopyWithImpl<_$BookParkingSpotStateImpl>(
              this, _$identity);
}

abstract class _BookParkingSpotState implements BookParkingSpotState {
  const factory _BookParkingSpotState({final RentalOfferModel? rentalOffer}) =
      _$BookParkingSpotStateImpl;

  @override
  RentalOfferModel? get rentalOffer;
  @override
  @JsonKey(ignore: true)
  _$$BookParkingSpotStateImplCopyWith<_$BookParkingSpotStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
