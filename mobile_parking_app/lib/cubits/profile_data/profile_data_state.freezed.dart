// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileDataState {
  String? get name => throw _privateConstructorUsedError;
  String? get surname => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileDataStateCopyWith<ProfileDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataStateCopyWith<$Res> {
  factory $ProfileDataStateCopyWith(
          ProfileDataState value, $Res Function(ProfileDataState) then) =
      _$ProfileDataStateCopyWithImpl<$Res, ProfileDataState>;
  @useResult
  $Res call({String? name, String? surname});
}

/// @nodoc
class _$ProfileDataStateCopyWithImpl<$Res, $Val extends ProfileDataState>
    implements $ProfileDataStateCopyWith<$Res> {
  _$ProfileDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDataStateImplCopyWith<$Res>
    implements $ProfileDataStateCopyWith<$Res> {
  factory _$$ProfileDataStateImplCopyWith(_$ProfileDataStateImpl value,
          $Res Function(_$ProfileDataStateImpl) then) =
      __$$ProfileDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? surname});
}

/// @nodoc
class __$$ProfileDataStateImplCopyWithImpl<$Res>
    extends _$ProfileDataStateCopyWithImpl<$Res, _$ProfileDataStateImpl>
    implements _$$ProfileDataStateImplCopyWith<$Res> {
  __$$ProfileDataStateImplCopyWithImpl(_$ProfileDataStateImpl _value,
      $Res Function(_$ProfileDataStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
  }) {
    return _then(_$ProfileDataStateImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProfileDataStateImpl implements _ProfileDataState {
  const _$ProfileDataStateImpl({this.name, this.surname});

  @override
  final String? name;
  @override
  final String? surname;

  @override
  String toString() {
    return 'ProfileDataState(name: $name, surname: $surname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, surname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataStateImplCopyWith<_$ProfileDataStateImpl> get copyWith =>
      __$$ProfileDataStateImplCopyWithImpl<_$ProfileDataStateImpl>(
          this, _$identity);
}

abstract class _ProfileDataState implements ProfileDataState {
  const factory _ProfileDataState({final String? name, final String? surname}) =
      _$ProfileDataStateImpl;

  @override
  String? get name;
  @override
  String? get surname;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDataStateImplCopyWith<_$ProfileDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
