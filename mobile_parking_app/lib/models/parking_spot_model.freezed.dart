// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parking_spot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParkingSpotModel _$ParkingSpotModelFromJson(Map<String, dynamic> json) {
  return _ParkingSpotModel.fromJson(json);
}

/// @nodoc
mixin _$ParkingSpotModel {
  String? get spotId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;
  bool? get internal => throw _privateConstructorUsedError;
  bool? get easyAccess => throw _privateConstructorUsedError;
  bool? get security => throw _privateConstructorUsedError;
  bool? get charging => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  List<String> get imagesUrls => throw _privateConstructorUsedError;
  int? get addressId => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParkingSpotModelCopyWith<ParkingSpotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParkingSpotModelCopyWith<$Res> {
  factory $ParkingSpotModelCopyWith(
          ParkingSpotModel value, $Res Function(ParkingSpotModel) then) =
      _$ParkingSpotModelCopyWithImpl<$Res, ParkingSpotModel>;
  @useResult
  $Res call(
      {String? spotId,
      String? name,
      String? description,
      double? height,
      double? width,
      double? length,
      bool? internal,
      bool? easyAccess,
      bool? security,
      bool? charging,
      String? ownerId,
      List<String> imagesUrls,
      int? addressId,
      AddressModel? address,
      double price,
      String currency});

  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$ParkingSpotModelCopyWithImpl<$Res, $Val extends ParkingSpotModel>
    implements $ParkingSpotModelCopyWith<$Res> {
  _$ParkingSpotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? length = freezed,
    Object? internal = freezed,
    Object? easyAccess = freezed,
    Object? security = freezed,
    Object? charging = freezed,
    Object? ownerId = freezed,
    Object? imagesUrls = null,
    Object? addressId = freezed,
    Object? address = freezed,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      spotId: freezed == spotId
          ? _value.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      internal: freezed == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as bool?,
      easyAccess: freezed == easyAccess
          ? _value.easyAccess
          : easyAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as bool?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesUrls: null == imagesUrls
          ? _value.imagesUrls
          : imagesUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParkingSpotModelImplCopyWith<$Res>
    implements $ParkingSpotModelCopyWith<$Res> {
  factory _$$ParkingSpotModelImplCopyWith(_$ParkingSpotModelImpl value,
          $Res Function(_$ParkingSpotModelImpl) then) =
      __$$ParkingSpotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? spotId,
      String? name,
      String? description,
      double? height,
      double? width,
      double? length,
      bool? internal,
      bool? easyAccess,
      bool? security,
      bool? charging,
      String? ownerId,
      List<String> imagesUrls,
      int? addressId,
      AddressModel? address,
      double price,
      String currency});

  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$$ParkingSpotModelImplCopyWithImpl<$Res>
    extends _$ParkingSpotModelCopyWithImpl<$Res, _$ParkingSpotModelImpl>
    implements _$$ParkingSpotModelImplCopyWith<$Res> {
  __$$ParkingSpotModelImplCopyWithImpl(_$ParkingSpotModelImpl _value,
      $Res Function(_$ParkingSpotModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotId = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? length = freezed,
    Object? internal = freezed,
    Object? easyAccess = freezed,
    Object? security = freezed,
    Object? charging = freezed,
    Object? ownerId = freezed,
    Object? imagesUrls = null,
    Object? addressId = freezed,
    Object? address = freezed,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$ParkingSpotModelImpl(
      spotId: freezed == spotId
          ? _value.spotId
          : spotId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
      internal: freezed == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as bool?,
      easyAccess: freezed == easyAccess
          ? _value.easyAccess
          : easyAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as bool?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesUrls: null == imagesUrls
          ? _value._imagesUrls
          : imagesUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      addressId: freezed == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParkingSpotModelImpl implements _ParkingSpotModel {
  const _$ParkingSpotModelImpl(
      {this.spotId,
      this.name,
      this.description,
      this.height,
      this.width,
      this.length,
      this.internal,
      this.easyAccess,
      this.security,
      this.charging,
      this.ownerId,
      final List<String> imagesUrls = const [],
      this.addressId,
      this.address,
      required this.price,
      this.currency = "USD"})
      : _imagesUrls = imagesUrls;

  factory _$ParkingSpotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingSpotModelImplFromJson(json);

  @override
  final String? spotId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? height;
  @override
  final double? width;
  @override
  final double? length;
  @override
  final bool? internal;
  @override
  final bool? easyAccess;
  @override
  final bool? security;
  @override
  final bool? charging;
  @override
  final String? ownerId;
  final List<String> _imagesUrls;
  @override
  @JsonKey()
  List<String> get imagesUrls {
    if (_imagesUrls is EqualUnmodifiableListView) return _imagesUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesUrls);
  }

  @override
  final int? addressId;
  @override
  final AddressModel? address;
  @override
  final double price;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'ParkingSpotModel(spotId: $spotId, name: $name, description: $description, height: $height, width: $width, length: $length, internal: $internal, easyAccess: $easyAccess, security: $security, charging: $charging, ownerId: $ownerId, imagesUrls: $imagesUrls, addressId: $addressId, address: $address, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParkingSpotModelImpl &&
            (identical(other.spotId, spotId) || other.spotId == spotId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.internal, internal) ||
                other.internal == internal) &&
            (identical(other.easyAccess, easyAccess) ||
                other.easyAccess == easyAccess) &&
            (identical(other.security, security) ||
                other.security == security) &&
            (identical(other.charging, charging) ||
                other.charging == charging) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            const DeepCollectionEquality()
                .equals(other._imagesUrls, _imagesUrls) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      spotId,
      name,
      description,
      height,
      width,
      length,
      internal,
      easyAccess,
      security,
      charging,
      ownerId,
      const DeepCollectionEquality().hash(_imagesUrls),
      addressId,
      address,
      price,
      currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParkingSpotModelImplCopyWith<_$ParkingSpotModelImpl> get copyWith =>
      __$$ParkingSpotModelImplCopyWithImpl<_$ParkingSpotModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParkingSpotModelImplToJson(
      this,
    );
  }
}

abstract class _ParkingSpotModel implements ParkingSpotModel {
  const factory _ParkingSpotModel(
      {final String? spotId,
      final String? name,
      final String? description,
      final double? height,
      final double? width,
      final double? length,
      final bool? internal,
      final bool? easyAccess,
      final bool? security,
      final bool? charging,
      final String? ownerId,
      final List<String> imagesUrls,
      final int? addressId,
      final AddressModel? address,
      required final double price,
      final String currency}) = _$ParkingSpotModelImpl;

  factory _ParkingSpotModel.fromJson(Map<String, dynamic> json) =
      _$ParkingSpotModelImpl.fromJson;

  @override
  String? get spotId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get height;
  @override
  double? get width;
  @override
  double? get length;
  @override
  bool? get internal;
  @override
  bool? get easyAccess;
  @override
  bool? get security;
  @override
  bool? get charging;
  @override
  String? get ownerId;
  @override
  List<String> get imagesUrls;
  @override
  int? get addressId;
  @override
  AddressModel? get address;
  @override
  double get price;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$ParkingSpotModelImplCopyWith<_$ParkingSpotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
