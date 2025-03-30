// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyCodeRequest _$VerifyCodeRequestFromJson(Map<String, dynamic> json) {
  return _VerifyCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyCodeRequest {
  String get username =>
      throw _privateConstructorUsedError; // Номер телефона (+998...)
  String get code => throw _privateConstructorUsedError;

  /// Serializes this VerifyCodeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyCodeRequestCopyWith<VerifyCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCodeRequestCopyWith<$Res> {
  factory $VerifyCodeRequestCopyWith(
          VerifyCodeRequest value, $Res Function(VerifyCodeRequest) then) =
      _$VerifyCodeRequestCopyWithImpl<$Res, VerifyCodeRequest>;
  @useResult
  $Res call({String username, String code});
}

/// @nodoc
class _$VerifyCodeRequestCopyWithImpl<$Res, $Val extends VerifyCodeRequest>
    implements $VerifyCodeRequestCopyWith<$Res> {
  _$VerifyCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyCodeRequestImplCopyWith<$Res>
    implements $VerifyCodeRequestCopyWith<$Res> {
  factory _$$VerifyCodeRequestImplCopyWith(_$VerifyCodeRequestImpl value,
          $Res Function(_$VerifyCodeRequestImpl) then) =
      __$$VerifyCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String code});
}

/// @nodoc
class __$$VerifyCodeRequestImplCopyWithImpl<$Res>
    extends _$VerifyCodeRequestCopyWithImpl<$Res, _$VerifyCodeRequestImpl>
    implements _$$VerifyCodeRequestImplCopyWith<$Res> {
  __$$VerifyCodeRequestImplCopyWithImpl(_$VerifyCodeRequestImpl _value,
      $Res Function(_$VerifyCodeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? code = null,
  }) {
    return _then(_$VerifyCodeRequestImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$VerifyCodeRequestImpl implements _VerifyCodeRequest {
  const _$VerifyCodeRequestImpl({required this.username, required this.code});

  factory _$VerifyCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyCodeRequestImplFromJson(json);

  @override
  final String username;
// Номер телефона (+998...)
  @override
  final String code;

  @override
  String toString() {
    return 'VerifyCodeRequest(username: $username, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeRequestImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, code);

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeRequestImplCopyWith<_$VerifyCodeRequestImpl> get copyWith =>
      __$$VerifyCodeRequestImplCopyWithImpl<_$VerifyCodeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyCodeRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyCodeRequest implements VerifyCodeRequest {
  const factory _VerifyCodeRequest(
      {required final String username,
      required final String code}) = _$VerifyCodeRequestImpl;

  factory _VerifyCodeRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyCodeRequestImpl.fromJson;

  @override
  String get username; // Номер телефона (+998...)
  @override
  String get code;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyCodeRequestImplCopyWith<_$VerifyCodeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyCodeResponse _$VerifyCodeResponseFromJson(Map<String, dynamic> json) {
  return _VerifyCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyCodeResponse {
  String get access => throw _privateConstructorUsedError; // Access token
  String get refresh => throw _privateConstructorUsedError; // Refresh token
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this VerifyCodeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyCodeResponseCopyWith<VerifyCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCodeResponseCopyWith<$Res> {
  factory $VerifyCodeResponseCopyWith(
          VerifyCodeResponse value, $Res Function(VerifyCodeResponse) then) =
      _$VerifyCodeResponseCopyWithImpl<$Res, VerifyCodeResponse>;
  @useResult
  $Res call({String access, String refresh, String? message});
}

/// @nodoc
class _$VerifyCodeResponseCopyWithImpl<$Res, $Val extends VerifyCodeResponse>
    implements $VerifyCodeResponseCopyWith<$Res> {
  _$VerifyCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyCodeResponseImplCopyWith<$Res>
    implements $VerifyCodeResponseCopyWith<$Res> {
  factory _$$VerifyCodeResponseImplCopyWith(_$VerifyCodeResponseImpl value,
          $Res Function(_$VerifyCodeResponseImpl) then) =
      __$$VerifyCodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access, String refresh, String? message});
}

/// @nodoc
class __$$VerifyCodeResponseImplCopyWithImpl<$Res>
    extends _$VerifyCodeResponseCopyWithImpl<$Res, _$VerifyCodeResponseImpl>
    implements _$$VerifyCodeResponseImplCopyWith<$Res> {
  __$$VerifyCodeResponseImplCopyWithImpl(_$VerifyCodeResponseImpl _value,
      $Res Function(_$VerifyCodeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
    Object? message = freezed,
  }) {
    return _then(_$VerifyCodeResponseImpl(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$VerifyCodeResponseImpl implements _VerifyCodeResponse {
  const _$VerifyCodeResponseImpl(
      {required this.access, required this.refresh, this.message});

  factory _$VerifyCodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyCodeResponseImplFromJson(json);

  @override
  final String access;
// Access token
  @override
  final String refresh;
// Refresh token
  @override
  final String? message;

  @override
  String toString() {
    return 'VerifyCodeResponse(access: $access, refresh: $refresh, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeResponseImpl &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, access, refresh, message);

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeResponseImplCopyWith<_$VerifyCodeResponseImpl> get copyWith =>
      __$$VerifyCodeResponseImplCopyWithImpl<_$VerifyCodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyCodeResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyCodeResponse implements VerifyCodeResponse {
  const factory _VerifyCodeResponse(
      {required final String access,
      required final String refresh,
      final String? message}) = _$VerifyCodeResponseImpl;

  factory _VerifyCodeResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyCodeResponseImpl.fromJson;

  @override
  String get access; // Access token
  @override
  String get refresh; // Refresh token
  @override
  String? get message;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyCodeResponseImplCopyWith<_$VerifyCodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
