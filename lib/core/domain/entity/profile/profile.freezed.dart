// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String? get surname => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_first_num')
  String? get phoneFirstNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_last_num')
  String? get phoneLastNum => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String? surname,
      @JsonKey(name: 'phone_first_num') String? phoneFirstNum,
      @JsonKey(name: 'phone_last_num') String? phoneLastNum,
      String? city,
      String? district});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surname = freezed,
    Object? phoneFirstNum = freezed,
    Object? phoneLastNum = freezed,
    Object? city = freezed,
    Object? district = freezed,
  }) {
    return _then(_value.copyWith(
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneFirstNum: freezed == phoneFirstNum
          ? _value.phoneFirstNum
          : phoneFirstNum // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneLastNum: freezed == phoneLastNum
          ? _value.phoneLastNum
          : phoneLastNum // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? surname,
      @JsonKey(name: 'phone_first_num') String? phoneFirstNum,
      @JsonKey(name: 'phone_last_num') String? phoneLastNum,
      String? city,
      String? district});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? surname = freezed,
    Object? phoneFirstNum = freezed,
    Object? phoneLastNum = freezed,
    Object? city = freezed,
    Object? district = freezed,
  }) {
    return _then(_$ProfileImpl(
      surname: freezed == surname
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneFirstNum: freezed == phoneFirstNum
          ? _value.phoneFirstNum
          : phoneFirstNum // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneLastNum: freezed == phoneLastNum
          ? _value.phoneLastNum
          : phoneLastNum // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {this.surname,
      @JsonKey(name: 'phone_first_num') this.phoneFirstNum,
      @JsonKey(name: 'phone_last_num') this.phoneLastNum,
      this.city,
      this.district});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String? surname;
  @override
  @JsonKey(name: 'phone_first_num')
  final String? phoneFirstNum;
  @override
  @JsonKey(name: 'phone_last_num')
  final String? phoneLastNum;
  @override
  final String? city;
  @override
  final String? district;

  @override
  String toString() {
    return 'Profile(surname: $surname, phoneFirstNum: $phoneFirstNum, phoneLastNum: $phoneLastNum, city: $city, district: $district)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.phoneFirstNum, phoneFirstNum) ||
                other.phoneFirstNum == phoneFirstNum) &&
            (identical(other.phoneLastNum, phoneLastNum) ||
                other.phoneLastNum == phoneLastNum) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, surname, phoneFirstNum, phoneLastNum, city, district);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {final String? surname,
      @JsonKey(name: 'phone_first_num') final String? phoneFirstNum,
      @JsonKey(name: 'phone_last_num') final String? phoneLastNum,
      final String? city,
      final String? district}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get surname;
  @override
  @JsonKey(name: 'phone_first_num')
  String? get phoneFirstNum;
  @override
  @JsonKey(name: 'phone_last_num')
  String? get phoneLastNum;
  @override
  String? get city;
  @override
  String? get district;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
