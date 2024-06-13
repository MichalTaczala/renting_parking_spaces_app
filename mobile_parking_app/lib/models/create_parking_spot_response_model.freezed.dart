// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_parking_spot_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateParkingSpotResponseModel _$CreateParkingSpotResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CreateParkingSpotResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CreateParkingSpotResponseModel {
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "parking_id")
  int? get parkingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateParkingSpotResponseModelCopyWith<CreateParkingSpotResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateParkingSpotResponseModelCopyWith<$Res> {
  factory $CreateParkingSpotResponseModelCopyWith(
          CreateParkingSpotResponseModel value,
          $Res Function(CreateParkingSpotResponseModel) then) =
      _$CreateParkingSpotResponseModelCopyWithImpl<$Res,
          CreateParkingSpotResponseModel>;
  @useResult
  $Res call({String? message, @JsonKey(name: "parking_id") int? parkingId});
}

/// @nodoc
class _$CreateParkingSpotResponseModelCopyWithImpl<$Res,
        $Val extends CreateParkingSpotResponseModel>
    implements $CreateParkingSpotResponseModelCopyWith<$Res> {
  _$CreateParkingSpotResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? parkingId = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      parkingId: freezed == parkingId
          ? _value.parkingId
          : parkingId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateParkingSpotResponseModelImplCopyWith<$Res>
    implements $CreateParkingSpotResponseModelCopyWith<$Res> {
  factory _$$CreateParkingSpotResponseModelImplCopyWith(
          _$CreateParkingSpotResponseModelImpl value,
          $Res Function(_$CreateParkingSpotResponseModelImpl) then) =
      __$$CreateParkingSpotResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, @JsonKey(name: "parking_id") int? parkingId});
}

/// @nodoc
class __$$CreateParkingSpotResponseModelImplCopyWithImpl<$Res>
    extends _$CreateParkingSpotResponseModelCopyWithImpl<$Res,
        _$CreateParkingSpotResponseModelImpl>
    implements _$$CreateParkingSpotResponseModelImplCopyWith<$Res> {
  __$$CreateParkingSpotResponseModelImplCopyWithImpl(
      _$CreateParkingSpotResponseModelImpl _value,
      $Res Function(_$CreateParkingSpotResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? parkingId = freezed,
  }) {
    return _then(_$CreateParkingSpotResponseModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      parkingId: freezed == parkingId
          ? _value.parkingId
          : parkingId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateParkingSpotResponseModelImpl
    implements _CreateParkingSpotResponseModel {
  const _$CreateParkingSpotResponseModelImpl(
      {this.message, @JsonKey(name: "parking_id") this.parkingId});

  factory _$CreateParkingSpotResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateParkingSpotResponseModelImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey(name: "parking_id")
  final int? parkingId;

  @override
  String toString() {
    return 'CreateParkingSpotResponseModel(message: $message, parkingId: $parkingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateParkingSpotResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.parkingId, parkingId) ||
                other.parkingId == parkingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, parkingId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateParkingSpotResponseModelImplCopyWith<
          _$CreateParkingSpotResponseModelImpl>
      get copyWith => __$$CreateParkingSpotResponseModelImplCopyWithImpl<
          _$CreateParkingSpotResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateParkingSpotResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CreateParkingSpotResponseModel
    implements CreateParkingSpotResponseModel {
  const factory _CreateParkingSpotResponseModel(
          {final String? message,
          @JsonKey(name: "parking_id") final int? parkingId}) =
      _$CreateParkingSpotResponseModelImpl;

  factory _CreateParkingSpotResponseModel.fromJson(Map<String, dynamic> json) =
      _$CreateParkingSpotResponseModelImpl.fromJson;

  @override
  String? get message;
  @override
  @JsonKey(name: "parking_id")
  int? get parkingId;
  @override
  @JsonKey(ignore: true)
  _$$CreateParkingSpotResponseModelImplCopyWith<
          _$CreateParkingSpotResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
