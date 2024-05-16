// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParkingDetailsModel _$ParkingDetailsModelFromJson(Map<String, dynamic> json) {
  return _ParkingDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$ParkingDetailsModel {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File>? get images => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  AddressModel? get location => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParkingDetailsModelCopyWith<ParkingDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingDetailsModelCopyWith<$Res> {
  factory $ParkingDetailsModelCopyWith(
          ParkingDetailsModel value, $Res Function(ParkingDetailsModel) then) =
      _$ParkingDetailsModelCopyWithImpl<$Res, ParkingDetailsModel>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? phone,
      String? email,
      @JsonKey(includeFromJson: false, includeToJson: false) List<File>? images,
      String description,
      AddressModel? location,
      double price,
      String currency,
      String? rating,
      String? distance});

  $AddressModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$ParkingDetailsModelCopyWithImpl<$Res, $Val extends ParkingDetailsModel>
    implements $ParkingDetailsModelCopyWith<$Res> {
  _$ParkingDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? images = freezed,
    Object? description = null,
    Object? location = freezed,
    Object? price = null,
    Object? currency = null,
    Object? rating = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParkingDetailsModelImplCopyWith<$Res>
    implements $ParkingDetailsModelCopyWith<$Res> {
  factory _$$ParkingDetailsModelImplCopyWith(_$ParkingDetailsModelImpl value,
          $Res Function(_$ParkingDetailsModelImpl) then) =
      __$$ParkingDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? phone,
      String? email,
      @JsonKey(includeFromJson: false, includeToJson: false) List<File>? images,
      String description,
      AddressModel? location,
      double price,
      String currency,
      String? rating,
      String? distance});

  @override
  $AddressModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$$ParkingDetailsModelImplCopyWithImpl<$Res>
    extends _$ParkingDetailsModelCopyWithImpl<$Res, _$ParkingDetailsModelImpl>
    implements _$$ParkingDetailsModelImplCopyWith<$Res> {
  __$$ParkingDetailsModelImplCopyWithImpl(_$ParkingDetailsModelImpl _value,
      $Res Function(_$ParkingDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? images = freezed,
    Object? description = null,
    Object? location = freezed,
    Object? price = null,
    Object? currency = null,
    Object? rating = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$ParkingDetailsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkingDetailsModelImpl implements _ParkingDetailsModel {
  const _$ParkingDetailsModelImpl(
      {this.id,
      required this.name,
      this.phone,
      this.email,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<File>? images,
      required this.description,
      this.location,
      required this.price,
      required this.currency,
      this.rating,
      this.distance})
      : _images = images;

  factory _$ParkingDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingDetailsModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String? phone;
  @override
  final String? email;
  final List<File>? _images;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String description;
  @override
  final AddressModel? location;
  @override
  final double price;
  @override
  final String currency;
  @override
  final String? rating;
  @override
  final String? distance;

  @override
  String toString() {
    return 'ParkingDetailsModel(id: $id, name: $name, phone: $phone, email: $email, images: $images, description: $description, location: $location, price: $price, currency: $currency, rating: $rating, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingDetailsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      phone,
      email,
      const DeepCollectionEquality().hash(_images),
      description,
      location,
      price,
      currency,
      rating,
      distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingDetailsModelImplCopyWith<_$ParkingDetailsModelImpl> get copyWith =>
      __$$ParkingDetailsModelImplCopyWithImpl<_$ParkingDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkingDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _ParkingDetailsModel implements ParkingDetailsModel {
  const factory _ParkingDetailsModel(
      {final String? id,
      required final String name,
      final String? phone,
      final String? email,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<File>? images,
      required final String description,
      final AddressModel? location,
      required final double price,
      required final String currency,
      final String? rating,
      final String? distance}) = _$ParkingDetailsModelImpl;

  factory _ParkingDetailsModel.fromJson(Map<String, dynamic> json) =
      _$ParkingDetailsModelImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<File>? get images;
  @override
  String get description;
  @override
  AddressModel? get location;
  @override
  double get price;
  @override
  String get currency;
  @override
  String? get rating;
  @override
  String? get distance;
  @override
  @JsonKey(ignore: true)
  _$$ParkingDetailsModelImplCopyWith<_$ParkingDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
