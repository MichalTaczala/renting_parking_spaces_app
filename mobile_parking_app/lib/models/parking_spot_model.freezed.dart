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
  @JsonKey(name: "spot_id")
  int? get spotId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get height => throw _privateConstructorUsedError;
  String? get width => throw _privateConstructorUsedError;
  String? get length => throw _privateConstructorUsedError;
  bool? get internal => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: "easy_access")
  bool? get easyAccess => throw _privateConstructorUsedError;
  bool? get security => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_id")
  int? get ownerId => throw _privateConstructorUsedError;
  bool? get charging => throw _privateConstructorUsedError;
  @JsonKey(name: "images_url")
  List<String> get imagesUrls => throw _privateConstructorUsedError;
  @JsonKey(name: "address_id")
  int? get addressId => throw _privateConstructorUsedError;
  AddressModel? get address => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "spot_id") int? spotId,
      String? name,
      String? description,
      String? height,
      String? width,
      String? length,
      bool? internal,
      String? distance,
      @JsonKey(name: "easy_access") bool? easyAccess,
      bool? security,
      @JsonKey(name: "owner_id") int? ownerId,
      bool? charging,
      @JsonKey(name: "images_url") List<String> imagesUrls,
      @JsonKey(name: "address_id") int? addressId,
      AddressModel? address,
      String price,
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
    Object? distance = freezed,
    Object? easyAccess = freezed,
    Object? security = freezed,
    Object? ownerId = freezed,
    Object? charging = freezed,
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
              as int?,
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
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String?,
      internal: freezed == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as bool?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      easyAccess: freezed == easyAccess
          ? _value.easyAccess
          : easyAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as String,
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
      {@JsonKey(name: "spot_id") int? spotId,
      String? name,
      String? description,
      String? height,
      String? width,
      String? length,
      bool? internal,
      String? distance,
      @JsonKey(name: "easy_access") bool? easyAccess,
      bool? security,
      @JsonKey(name: "owner_id") int? ownerId,
      bool? charging,
      @JsonKey(name: "images_url") List<String> imagesUrls,
      @JsonKey(name: "address_id") int? addressId,
      AddressModel? address,
      String price,
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
    Object? distance = freezed,
    Object? easyAccess = freezed,
    Object? security = freezed,
    Object? ownerId = freezed,
    Object? charging = freezed,
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
              as int?,
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
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as String?,
      internal: freezed == internal
          ? _value.internal
          : internal // ignore: cast_nullable_to_non_nullable
              as bool?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      easyAccess: freezed == easyAccess
          ? _value.easyAccess
          : easyAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      security: freezed == security
          ? _value.security
          : security // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as int?,
      charging: freezed == charging
          ? _value.charging
          : charging // ignore: cast_nullable_to_non_nullable
              as bool?,
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
              as String,
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
      {@JsonKey(name: "spot_id") this.spotId,
      this.name,
      this.description,
      this.height,
      this.width,
      this.length,
      this.internal,
      this.distance,
      @JsonKey(name: "easy_access") this.easyAccess,
      this.security,
      @JsonKey(name: "owner_id") this.ownerId,
      this.charging,
      @JsonKey(name: "images_url") final List<String> imagesUrls = const [],
      @JsonKey(name: "address_id") this.addressId,
      this.address,
      required this.price,
      this.currency = "USD"})
      : _imagesUrls = imagesUrls;

  factory _$ParkingSpotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParkingSpotModelImplFromJson(json);

  @override
  @JsonKey(name: "spot_id")
  final int? spotId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? height;
  @override
  final String? width;
  @override
  final String? length;
  @override
  final bool? internal;
  @override
  final String? distance;
  @override
  @JsonKey(name: "easy_access")
  final bool? easyAccess;
  @override
  final bool? security;
  @override
  @JsonKey(name: "owner_id")
  final int? ownerId;
  @override
  final bool? charging;
  final List<String> _imagesUrls;
  @override
  @JsonKey(name: "images_url")
  List<String> get imagesUrls {
    if (_imagesUrls is EqualUnmodifiableListView) return _imagesUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesUrls);
  }

  @override
  @JsonKey(name: "address_id")
  final int? addressId;
  @override
  final AddressModel? address;
  @override
  final String price;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'ParkingSpotModel(spotId: $spotId, name: $name, description: $description, height: $height, width: $width, length: $length, internal: $internal, distance: $distance, easyAccess: $easyAccess, security: $security, ownerId: $ownerId, charging: $charging, imagesUrls: $imagesUrls, addressId: $addressId, address: $address, price: $price, currency: $currency)';
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
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.easyAccess, easyAccess) ||
                other.easyAccess == easyAccess) &&
            (identical(other.security, security) ||
                other.security == security) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.charging, charging) ||
                other.charging == charging) &&
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
      distance,
      easyAccess,
      security,
      ownerId,
      charging,
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
      {@JsonKey(name: "spot_id") final int? spotId,
      final String? name,
      final String? description,
      final String? height,
      final String? width,
      final String? length,
      final bool? internal,
      final String? distance,
      @JsonKey(name: "easy_access") final bool? easyAccess,
      final bool? security,
      @JsonKey(name: "owner_id") final int? ownerId,
      final bool? charging,
      @JsonKey(name: "images_url") final List<String> imagesUrls,
      @JsonKey(name: "address_id") final int? addressId,
      final AddressModel? address,
      required final String price,
      final String currency}) = _$ParkingSpotModelImpl;

  factory _ParkingSpotModel.fromJson(Map<String, dynamic> json) =
      _$ParkingSpotModelImpl.fromJson;

  @override
  @JsonKey(name: "spot_id")
  int? get spotId;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get height;
  @override
  String? get width;
  @override
  String? get length;
  @override
  bool? get internal;
  @override
  String? get distance;
  @override
  @JsonKey(name: "easy_access")
  bool? get easyAccess;
  @override
  bool? get security;
  @override
  @JsonKey(name: "owner_id")
  int? get ownerId;
  @override
  bool? get charging;
  @override
  @JsonKey(name: "images_url")
  List<String> get imagesUrls;
  @override
  @JsonKey(name: "address_id")
  int? get addressId;
  @override
  AddressModel? get address;
  @override
  String get price;
  @override
  String get currency;
  @override
  @JsonKey(ignore: true)
  _$$ParkingSpotModelImplCopyWith<_$ParkingSpotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
