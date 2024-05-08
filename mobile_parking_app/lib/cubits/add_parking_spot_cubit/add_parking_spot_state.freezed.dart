// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_parking_spot_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddParkingSpotState {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<File> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddParkingSpotStateCopyWith<AddParkingSpotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddParkingSpotStateCopyWith<$Res> {
  factory $AddParkingSpotStateCopyWith(
          AddParkingSpotState value, $Res Function(AddParkingSpotState) then) =
      _$AddParkingSpotStateCopyWithImpl<$Res, AddParkingSpotState>;
  @useResult
  $Res call(
      {String name,
      String address,
      double price,
      String description,
      List<File> images});
}

/// @nodoc
class _$AddParkingSpotStateCopyWithImpl<$Res, $Val extends AddParkingSpotState>
    implements $AddParkingSpotStateCopyWith<$Res> {
  _$AddParkingSpotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? price = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddParkingSpotStateImplCopyWith<$Res>
    implements $AddParkingSpotStateCopyWith<$Res> {
  factory _$$AddParkingSpotStateImplCopyWith(_$AddParkingSpotStateImpl value,
          $Res Function(_$AddParkingSpotStateImpl) then) =
      __$$AddParkingSpotStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      double price,
      String description,
      List<File> images});
}

/// @nodoc
class __$$AddParkingSpotStateImplCopyWithImpl<$Res>
    extends _$AddParkingSpotStateCopyWithImpl<$Res, _$AddParkingSpotStateImpl>
    implements _$$AddParkingSpotStateImplCopyWith<$Res> {
  __$$AddParkingSpotStateImplCopyWithImpl(_$AddParkingSpotStateImpl _value,
      $Res Function(_$AddParkingSpotStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? price = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_$AddParkingSpotStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$AddParkingSpotStateImpl implements _AddParkingSpotState {
  const _$AddParkingSpotStateImpl(
      {this.name = "",
      this.address = "",
      this.price = 0,
      this.description = "",
      final List<File> images = const []})
      : _images = images;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final String description;
  final List<File> _images;
  @override
  @JsonKey()
  List<File> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'AddParkingSpotState(name: $name, address: $address, price: $price, description: $description, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddParkingSpotStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, address, price,
      description, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddParkingSpotStateImplCopyWith<_$AddParkingSpotStateImpl> get copyWith =>
      __$$AddParkingSpotStateImplCopyWithImpl<_$AddParkingSpotStateImpl>(
          this, _$identity);
}

abstract class _AddParkingSpotState implements AddParkingSpotState {
  const factory _AddParkingSpotState(
      {final String name,
      final String address,
      final double price,
      final String description,
      final List<File> images}) = _$AddParkingSpotStateImpl;

  @override
  String get name;
  @override
  String get address;
  @override
  double get price;
  @override
  String get description;
  @override
  List<File> get images;
  @override
  @JsonKey(ignore: true)
  _$$AddParkingSpotStateImplCopyWith<_$AddParkingSpotStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
