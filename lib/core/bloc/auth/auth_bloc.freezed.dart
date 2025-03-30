// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  String get phone => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) send,
    required TResult Function(String phone, String code) verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? send,
    TResult? Function(String phone, String code)? verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? send,
    TResult Function(String phone, String code)? verify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendAuthEvent value) send,
    required TResult Function(_VerifyAuthEvent value) verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendAuthEvent value)? send,
    TResult? Function(_VerifyAuthEvent value)? verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendAuthEvent value)? send,
    TResult Function(_VerifyAuthEvent value)? verify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthEventCopyWith<AuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendAuthEventImplCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$$SendAuthEventImplCopyWith(
          _$SendAuthEventImpl value, $Res Function(_$SendAuthEventImpl) then) =
      __$$SendAuthEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$SendAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendAuthEventImpl>
    implements _$$SendAuthEventImplCopyWith<$Res> {
  __$$SendAuthEventImplCopyWithImpl(
      _$SendAuthEventImpl _value, $Res Function(_$SendAuthEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$SendAuthEventImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendAuthEventImpl implements _SendAuthEvent {
  const _$SendAuthEventImpl(this.phone);

  @override
  final String phone;

  @override
  String toString() {
    return 'AuthEvent.send(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendAuthEventImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendAuthEventImplCopyWith<_$SendAuthEventImpl> get copyWith =>
      __$$SendAuthEventImplCopyWithImpl<_$SendAuthEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) send,
    required TResult Function(String phone, String code) verify,
  }) {
    return send(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? send,
    TResult? Function(String phone, String code)? verify,
  }) {
    return send?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? send,
    TResult Function(String phone, String code)? verify,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendAuthEvent value) send,
    required TResult Function(_VerifyAuthEvent value) verify,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendAuthEvent value)? send,
    TResult? Function(_VerifyAuthEvent value)? verify,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendAuthEvent value)? send,
    TResult Function(_VerifyAuthEvent value)? verify,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _SendAuthEvent implements AuthEvent {
  const factory _SendAuthEvent(final String phone) = _$SendAuthEventImpl;

  @override
  String get phone;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendAuthEventImplCopyWith<_$SendAuthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyAuthEventImplCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$$VerifyAuthEventImplCopyWith(_$VerifyAuthEventImpl value,
          $Res Function(_$VerifyAuthEventImpl) then) =
      __$$VerifyAuthEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String code});
}

/// @nodoc
class __$$VerifyAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyAuthEventImpl>
    implements _$$VerifyAuthEventImplCopyWith<$Res> {
  __$$VerifyAuthEventImplCopyWithImpl(
      _$VerifyAuthEventImpl _value, $Res Function(_$VerifyAuthEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? code = null,
  }) {
    return _then(_$VerifyAuthEventImpl(
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyAuthEventImpl implements _VerifyAuthEvent {
  const _$VerifyAuthEventImpl(this.phone, this.code);

  @override
  final String phone;
  @override
  final String code;

  @override
  String toString() {
    return 'AuthEvent.verify(phone: $phone, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyAuthEventImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone, code);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyAuthEventImplCopyWith<_$VerifyAuthEventImpl> get copyWith =>
      __$$VerifyAuthEventImplCopyWithImpl<_$VerifyAuthEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) send,
    required TResult Function(String phone, String code) verify,
  }) {
    return verify(phone, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? send,
    TResult? Function(String phone, String code)? verify,
  }) {
    return verify?.call(phone, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? send,
    TResult Function(String phone, String code)? verify,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(phone, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendAuthEvent value) send,
    required TResult Function(_VerifyAuthEvent value) verify,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendAuthEvent value)? send,
    TResult? Function(_VerifyAuthEvent value)? verify,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendAuthEvent value)? send,
    TResult Function(_VerifyAuthEvent value)? verify,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _VerifyAuthEvent implements AuthEvent {
  const factory _VerifyAuthEvent(final String phone, final String code) =
      _$VerifyAuthEventImpl;

  @override
  String get phone;
  String get code;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyAuthEventImplCopyWith<_$VerifyAuthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() verifySuccess,
    required TResult Function() verifyUnsuccess,
    required TResult Function(String message) errorSend,
    required TResult Function(String code) wasSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? verifySuccess,
    TResult? Function()? verifyUnsuccess,
    TResult? Function(String message)? errorSend,
    TResult? Function(String code)? wasSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? verifySuccess,
    TResult Function()? verifyUnsuccess,
    TResult Function(String message)? errorSend,
    TResult Function(String code)? wasSend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAuthState value) loading,
    required TResult Function(_VerifySuccessAuthState value) verifySuccess,
    required TResult Function(_VerifyUnsuccessAuthState value) verifyUnsuccess,
    required TResult Function(_ErrorSendAuthState value) errorSend,
    required TResult Function(_WasSendAuthState value) wasSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAuthState value)? loading,
    TResult? Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult? Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult? Function(_ErrorSendAuthState value)? errorSend,
    TResult? Function(_WasSendAuthState value)? wasSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAuthState value)? loading,
    TResult Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult Function(_ErrorSendAuthState value)? errorSend,
    TResult Function(_WasSendAuthState value)? wasSend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingAuthStateImplCopyWith<$Res> {
  factory _$$LoadingAuthStateImplCopyWith(_$LoadingAuthStateImpl value,
          $Res Function(_$LoadingAuthStateImpl) then) =
      __$$LoadingAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingAuthStateImpl>
    implements _$$LoadingAuthStateImplCopyWith<$Res> {
  __$$LoadingAuthStateImplCopyWithImpl(_$LoadingAuthStateImpl _value,
      $Res Function(_$LoadingAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingAuthStateImpl implements _LoadingAuthState {
  const _$LoadingAuthStateImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() verifySuccess,
    required TResult Function() verifyUnsuccess,
    required TResult Function(String message) errorSend,
    required TResult Function(String code) wasSend,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? verifySuccess,
    TResult? Function()? verifyUnsuccess,
    TResult? Function(String message)? errorSend,
    TResult? Function(String code)? wasSend,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? verifySuccess,
    TResult Function()? verifyUnsuccess,
    TResult Function(String message)? errorSend,
    TResult Function(String code)? wasSend,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAuthState value) loading,
    required TResult Function(_VerifySuccessAuthState value) verifySuccess,
    required TResult Function(_VerifyUnsuccessAuthState value) verifyUnsuccess,
    required TResult Function(_ErrorSendAuthState value) errorSend,
    required TResult Function(_WasSendAuthState value) wasSend,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAuthState value)? loading,
    TResult? Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult? Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult? Function(_ErrorSendAuthState value)? errorSend,
    TResult? Function(_WasSendAuthState value)? wasSend,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAuthState value)? loading,
    TResult Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult Function(_ErrorSendAuthState value)? errorSend,
    TResult Function(_WasSendAuthState value)? wasSend,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingAuthState implements AuthState {
  const factory _LoadingAuthState() = _$LoadingAuthStateImpl;
}

/// @nodoc
abstract class _$$VerifySuccessAuthStateImplCopyWith<$Res> {
  factory _$$VerifySuccessAuthStateImplCopyWith(
          _$VerifySuccessAuthStateImpl value,
          $Res Function(_$VerifySuccessAuthStateImpl) then) =
      __$$VerifySuccessAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifySuccessAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerifySuccessAuthStateImpl>
    implements _$$VerifySuccessAuthStateImplCopyWith<$Res> {
  __$$VerifySuccessAuthStateImplCopyWithImpl(
      _$VerifySuccessAuthStateImpl _value,
      $Res Function(_$VerifySuccessAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifySuccessAuthStateImpl implements _VerifySuccessAuthState {
  const _$VerifySuccessAuthStateImpl();

  @override
  String toString() {
    return 'AuthState.verifySuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifySuccessAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() verifySuccess,
    required TResult Function() verifyUnsuccess,
    required TResult Function(String message) errorSend,
    required TResult Function(String code) wasSend,
  }) {
    return verifySuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? verifySuccess,
    TResult? Function()? verifyUnsuccess,
    TResult? Function(String message)? errorSend,
    TResult? Function(String code)? wasSend,
  }) {
    return verifySuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? verifySuccess,
    TResult Function()? verifyUnsuccess,
    TResult Function(String message)? errorSend,
    TResult Function(String code)? wasSend,
    required TResult orElse(),
  }) {
    if (verifySuccess != null) {
      return verifySuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAuthState value) loading,
    required TResult Function(_VerifySuccessAuthState value) verifySuccess,
    required TResult Function(_VerifyUnsuccessAuthState value) verifyUnsuccess,
    required TResult Function(_ErrorSendAuthState value) errorSend,
    required TResult Function(_WasSendAuthState value) wasSend,
  }) {
    return verifySuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAuthState value)? loading,
    TResult? Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult? Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult? Function(_ErrorSendAuthState value)? errorSend,
    TResult? Function(_WasSendAuthState value)? wasSend,
  }) {
    return verifySuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAuthState value)? loading,
    TResult Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult Function(_ErrorSendAuthState value)? errorSend,
    TResult Function(_WasSendAuthState value)? wasSend,
    required TResult orElse(),
  }) {
    if (verifySuccess != null) {
      return verifySuccess(this);
    }
    return orElse();
  }
}

abstract class _VerifySuccessAuthState implements AuthState {
  const factory _VerifySuccessAuthState() = _$VerifySuccessAuthStateImpl;
}

/// @nodoc
abstract class _$$VerifyUnsuccessAuthStateImplCopyWith<$Res> {
  factory _$$VerifyUnsuccessAuthStateImplCopyWith(
          _$VerifyUnsuccessAuthStateImpl value,
          $Res Function(_$VerifyUnsuccessAuthStateImpl) then) =
      __$$VerifyUnsuccessAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyUnsuccessAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VerifyUnsuccessAuthStateImpl>
    implements _$$VerifyUnsuccessAuthStateImplCopyWith<$Res> {
  __$$VerifyUnsuccessAuthStateImplCopyWithImpl(
      _$VerifyUnsuccessAuthStateImpl _value,
      $Res Function(_$VerifyUnsuccessAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyUnsuccessAuthStateImpl implements _VerifyUnsuccessAuthState {
  const _$VerifyUnsuccessAuthStateImpl();

  @override
  String toString() {
    return 'AuthState.verifyUnsuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyUnsuccessAuthStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() verifySuccess,
    required TResult Function() verifyUnsuccess,
    required TResult Function(String message) errorSend,
    required TResult Function(String code) wasSend,
  }) {
    return verifyUnsuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? verifySuccess,
    TResult? Function()? verifyUnsuccess,
    TResult? Function(String message)? errorSend,
    TResult? Function(String code)? wasSend,
  }) {
    return verifyUnsuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? verifySuccess,
    TResult Function()? verifyUnsuccess,
    TResult Function(String message)? errorSend,
    TResult Function(String code)? wasSend,
    required TResult orElse(),
  }) {
    if (verifyUnsuccess != null) {
      return verifyUnsuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAuthState value) loading,
    required TResult Function(_VerifySuccessAuthState value) verifySuccess,
    required TResult Function(_VerifyUnsuccessAuthState value) verifyUnsuccess,
    required TResult Function(_ErrorSendAuthState value) errorSend,
    required TResult Function(_WasSendAuthState value) wasSend,
  }) {
    return verifyUnsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAuthState value)? loading,
    TResult? Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult? Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult? Function(_ErrorSendAuthState value)? errorSend,
    TResult? Function(_WasSendAuthState value)? wasSend,
  }) {
    return verifyUnsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAuthState value)? loading,
    TResult Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult Function(_ErrorSendAuthState value)? errorSend,
    TResult Function(_WasSendAuthState value)? wasSend,
    required TResult orElse(),
  }) {
    if (verifyUnsuccess != null) {
      return verifyUnsuccess(this);
    }
    return orElse();
  }
}

abstract class _VerifyUnsuccessAuthState implements AuthState {
  const factory _VerifyUnsuccessAuthState() = _$VerifyUnsuccessAuthStateImpl;
}

/// @nodoc
abstract class _$$ErrorSendAuthStateImplCopyWith<$Res> {
  factory _$$ErrorSendAuthStateImplCopyWith(_$ErrorSendAuthStateImpl value,
          $Res Function(_$ErrorSendAuthStateImpl) then) =
      __$$ErrorSendAuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorSendAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorSendAuthStateImpl>
    implements _$$ErrorSendAuthStateImplCopyWith<$Res> {
  __$$ErrorSendAuthStateImplCopyWithImpl(_$ErrorSendAuthStateImpl _value,
      $Res Function(_$ErrorSendAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorSendAuthStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorSendAuthStateImpl implements _ErrorSendAuthState {
  const _$ErrorSendAuthStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.errorSend(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSendAuthStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSendAuthStateImplCopyWith<_$ErrorSendAuthStateImpl> get copyWith =>
      __$$ErrorSendAuthStateImplCopyWithImpl<_$ErrorSendAuthStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() verifySuccess,
    required TResult Function() verifyUnsuccess,
    required TResult Function(String message) errorSend,
    required TResult Function(String code) wasSend,
  }) {
    return errorSend(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? verifySuccess,
    TResult? Function()? verifyUnsuccess,
    TResult? Function(String message)? errorSend,
    TResult? Function(String code)? wasSend,
  }) {
    return errorSend?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? verifySuccess,
    TResult Function()? verifyUnsuccess,
    TResult Function(String message)? errorSend,
    TResult Function(String code)? wasSend,
    required TResult orElse(),
  }) {
    if (errorSend != null) {
      return errorSend(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAuthState value) loading,
    required TResult Function(_VerifySuccessAuthState value) verifySuccess,
    required TResult Function(_VerifyUnsuccessAuthState value) verifyUnsuccess,
    required TResult Function(_ErrorSendAuthState value) errorSend,
    required TResult Function(_WasSendAuthState value) wasSend,
  }) {
    return errorSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAuthState value)? loading,
    TResult? Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult? Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult? Function(_ErrorSendAuthState value)? errorSend,
    TResult? Function(_WasSendAuthState value)? wasSend,
  }) {
    return errorSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAuthState value)? loading,
    TResult Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult Function(_ErrorSendAuthState value)? errorSend,
    TResult Function(_WasSendAuthState value)? wasSend,
    required TResult orElse(),
  }) {
    if (errorSend != null) {
      return errorSend(this);
    }
    return orElse();
  }
}

abstract class _ErrorSendAuthState implements AuthState {
  const factory _ErrorSendAuthState(final String message) =
      _$ErrorSendAuthStateImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSendAuthStateImplCopyWith<_$ErrorSendAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WasSendAuthStateImplCopyWith<$Res> {
  factory _$$WasSendAuthStateImplCopyWith(_$WasSendAuthStateImpl value,
          $Res Function(_$WasSendAuthStateImpl) then) =
      __$$WasSendAuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$WasSendAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$WasSendAuthStateImpl>
    implements _$$WasSendAuthStateImplCopyWith<$Res> {
  __$$WasSendAuthStateImplCopyWithImpl(_$WasSendAuthStateImpl _value,
      $Res Function(_$WasSendAuthStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$WasSendAuthStateImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WasSendAuthStateImpl implements _WasSendAuthState {
  const _$WasSendAuthStateImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'AuthState.wasSend(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasSendAuthStateImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WasSendAuthStateImplCopyWith<_$WasSendAuthStateImpl> get copyWith =>
      __$$WasSendAuthStateImplCopyWithImpl<_$WasSendAuthStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() verifySuccess,
    required TResult Function() verifyUnsuccess,
    required TResult Function(String message) errorSend,
    required TResult Function(String code) wasSend,
  }) {
    return wasSend(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? verifySuccess,
    TResult? Function()? verifyUnsuccess,
    TResult? Function(String message)? errorSend,
    TResult? Function(String code)? wasSend,
  }) {
    return wasSend?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? verifySuccess,
    TResult Function()? verifyUnsuccess,
    TResult Function(String message)? errorSend,
    TResult Function(String code)? wasSend,
    required TResult orElse(),
  }) {
    if (wasSend != null) {
      return wasSend(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingAuthState value) loading,
    required TResult Function(_VerifySuccessAuthState value) verifySuccess,
    required TResult Function(_VerifyUnsuccessAuthState value) verifyUnsuccess,
    required TResult Function(_ErrorSendAuthState value) errorSend,
    required TResult Function(_WasSendAuthState value) wasSend,
  }) {
    return wasSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingAuthState value)? loading,
    TResult? Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult? Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult? Function(_ErrorSendAuthState value)? errorSend,
    TResult? Function(_WasSendAuthState value)? wasSend,
  }) {
    return wasSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingAuthState value)? loading,
    TResult Function(_VerifySuccessAuthState value)? verifySuccess,
    TResult Function(_VerifyUnsuccessAuthState value)? verifyUnsuccess,
    TResult Function(_ErrorSendAuthState value)? errorSend,
    TResult Function(_WasSendAuthState value)? wasSend,
    required TResult orElse(),
  }) {
    if (wasSend != null) {
      return wasSend(this);
    }
    return orElse();
  }
}

abstract class _WasSendAuthState implements AuthState {
  const factory _WasSendAuthState(final String code) = _$WasSendAuthStateImpl;

  String get code;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WasSendAuthStateImplCopyWith<_$WasSendAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
