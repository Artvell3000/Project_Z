// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_code_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendCodeRequest _$SendCodeRequestFromJson(Map<String, dynamic> json) {
  return _SendCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$SendCodeRequest {
  String get username => throw _privateConstructorUsedError;

  /// Serializes this SendCodeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendCodeRequestCopyWith<SendCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCodeRequestCopyWith<$Res> {
  factory $SendCodeRequestCopyWith(
          SendCodeRequest value, $Res Function(SendCodeRequest) then) =
      _$SendCodeRequestCopyWithImpl<$Res, SendCodeRequest>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class _$SendCodeRequestCopyWithImpl<$Res, $Val extends SendCodeRequest>
    implements $SendCodeRequestCopyWith<$Res> {
  _$SendCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendCodeRequestImplCopyWith<$Res>
    implements $SendCodeRequestCopyWith<$Res> {
  factory _$$SendCodeRequestImplCopyWith(_$SendCodeRequestImpl value,
          $Res Function(_$SendCodeRequestImpl) then) =
      __$$SendCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$SendCodeRequestImplCopyWithImpl<$Res>
    extends _$SendCodeRequestCopyWithImpl<$Res, _$SendCodeRequestImpl>
    implements _$$SendCodeRequestImplCopyWith<$Res> {
  __$$SendCodeRequestImplCopyWithImpl(
      _$SendCodeRequestImpl _value, $Res Function(_$SendCodeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$SendCodeRequestImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SendCodeRequestImpl implements _SendCodeRequest {
  const _$SendCodeRequestImpl({required this.username});

  factory _$SendCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendCodeRequestImplFromJson(json);

  @override
  final String username;

  @override
  String toString() {
    return 'SendCodeRequest(username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeRequestImpl &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username);

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeRequestImplCopyWith<_$SendCodeRequestImpl> get copyWith =>
      __$$SendCodeRequestImplCopyWithImpl<_$SendCodeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendCodeRequestImplToJson(
      this,
    );
  }
}

abstract class _SendCodeRequest implements SendCodeRequest {
  const factory _SendCodeRequest({required final String username}) =
      _$SendCodeRequestImpl;

  factory _SendCodeRequest.fromJson(Map<String, dynamic> json) =
      _$SendCodeRequestImpl.fromJson;

  @override
  String get username;

  /// Create a copy of SendCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCodeRequestImplCopyWith<_$SendCodeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendCodeResponse _$SendCodeResponseFromJson(Map<String, dynamic> json) {
  return _SendCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$SendCodeResponse {
  String? get code => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SendCodeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendCodeResponseCopyWith<SendCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCodeResponseCopyWith<$Res> {
  factory $SendCodeResponseCopyWith(
          SendCodeResponse value, $Res Function(SendCodeResponse) then) =
      _$SendCodeResponseCopyWithImpl<$Res, SendCodeResponse>;
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class _$SendCodeResponseCopyWithImpl<$Res, $Val extends SendCodeResponse>
    implements $SendCodeResponseCopyWith<$Res> {
  _$SendCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendCodeResponseImplCopyWith<$Res>
    implements $SendCodeResponseCopyWith<$Res> {
  factory _$$SendCodeResponseImplCopyWith(_$SendCodeResponseImpl value,
          $Res Function(_$SendCodeResponseImpl) then) =
      __$$SendCodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String? message});
}

/// @nodoc
class __$$SendCodeResponseImplCopyWithImpl<$Res>
    extends _$SendCodeResponseCopyWithImpl<$Res, _$SendCodeResponseImpl>
    implements _$$SendCodeResponseImplCopyWith<$Res> {
  __$$SendCodeResponseImplCopyWithImpl(_$SendCodeResponseImpl _value,
      $Res Function(_$SendCodeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SendCodeResponseImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SendCodeResponseImpl implements _SendCodeResponse {
  const _$SendCodeResponseImpl({this.code, this.message});

  factory _$SendCodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendCodeResponseImplFromJson(json);

  @override
  final String? code;
  @override
  final String? message;

  @override
  String toString() {
    return 'SendCodeResponse(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of SendCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeResponseImplCopyWith<_$SendCodeResponseImpl> get copyWith =>
      __$$SendCodeResponseImplCopyWithImpl<_$SendCodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendCodeResponseImplToJson(
      this,
    );
  }
}

abstract class _SendCodeResponse implements SendCodeResponse {
  const factory _SendCodeResponse({final String? code, final String? message}) =
      _$SendCodeResponseImpl;

  factory _SendCodeResponse.fromJson(Map<String, dynamic> json) =
      _$SendCodeResponseImpl.fromJson;

  @override
  String? get code;
  @override
  String? get message;

  /// Create a copy of SendCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCodeResponseImplCopyWith<_$SendCodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
