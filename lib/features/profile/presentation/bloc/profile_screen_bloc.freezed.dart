// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(CustomUserJson profile) refresh,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(CustomUserJson profile)? refresh,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(CustomUserJson profile)? refresh,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProfileScreenEvent value) loaded,
    required TResult Function(_RefreshProfileScreenEvent value) refresh,
    required TResult Function(_ErrorProfileScreenEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProfileScreenEvent value)? loaded,
    TResult? Function(_RefreshProfileScreenEvent value)? refresh,
    TResult? Function(_ErrorProfileScreenEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProfileScreenEvent value)? loaded,
    TResult Function(_RefreshProfileScreenEvent value)? refresh,
    TResult Function(_ErrorProfileScreenEvent value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenEventCopyWith<$Res> {
  factory $ProfileScreenEventCopyWith(
          ProfileScreenEvent value, $Res Function(ProfileScreenEvent) then) =
      _$ProfileScreenEventCopyWithImpl<$Res, ProfileScreenEvent>;
}

/// @nodoc
class _$ProfileScreenEventCopyWithImpl<$Res, $Val extends ProfileScreenEvent>
    implements $ProfileScreenEventCopyWith<$Res> {
  _$ProfileScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProfileScreenEventImplCopyWith<$Res> {
  factory _$$LoadProfileScreenEventImplCopyWith(
          _$LoadProfileScreenEventImpl value,
          $Res Function(_$LoadProfileScreenEventImpl) then) =
      __$$LoadProfileScreenEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomUserJson profile});

  $CustomUserJsonCopyWith<$Res> get profile;
}

/// @nodoc
class __$$LoadProfileScreenEventImplCopyWithImpl<$Res>
    extends _$ProfileScreenEventCopyWithImpl<$Res, _$LoadProfileScreenEventImpl>
    implements _$$LoadProfileScreenEventImplCopyWith<$Res> {
  __$$LoadProfileScreenEventImplCopyWithImpl(
      _$LoadProfileScreenEventImpl _value,
      $Res Function(_$LoadProfileScreenEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$LoadProfileScreenEventImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as CustomUserJson,
    ));
  }

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomUserJsonCopyWith<$Res> get profile {
    return $CustomUserJsonCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$LoadProfileScreenEventImpl implements _LoadProfileScreenEvent {
  const _$LoadProfileScreenEventImpl(this.profile);

  @override
  final CustomUserJson profile;

  @override
  String toString() {
    return 'ProfileScreenEvent.loaded(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfileScreenEventImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProfileScreenEventImplCopyWith<_$LoadProfileScreenEventImpl>
      get copyWith => __$$LoadProfileScreenEventImplCopyWithImpl<
          _$LoadProfileScreenEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(CustomUserJson profile) refresh,
    required TResult Function(String message) error,
  }) {
    return loaded(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(CustomUserJson profile)? refresh,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(CustomUserJson profile)? refresh,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProfileScreenEvent value) loaded,
    required TResult Function(_RefreshProfileScreenEvent value) refresh,
    required TResult Function(_ErrorProfileScreenEvent value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProfileScreenEvent value)? loaded,
    TResult? Function(_RefreshProfileScreenEvent value)? refresh,
    TResult? Function(_ErrorProfileScreenEvent value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProfileScreenEvent value)? loaded,
    TResult Function(_RefreshProfileScreenEvent value)? refresh,
    TResult Function(_ErrorProfileScreenEvent value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadProfileScreenEvent implements ProfileScreenEvent {
  const factory _LoadProfileScreenEvent(final CustomUserJson profile) =
      _$LoadProfileScreenEventImpl;

  CustomUserJson get profile;

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProfileScreenEventImplCopyWith<_$LoadProfileScreenEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshProfileScreenEventImplCopyWith<$Res> {
  factory _$$RefreshProfileScreenEventImplCopyWith(
          _$RefreshProfileScreenEventImpl value,
          $Res Function(_$RefreshProfileScreenEventImpl) then) =
      __$$RefreshProfileScreenEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomUserJson profile});

  $CustomUserJsonCopyWith<$Res> get profile;
}

/// @nodoc
class __$$RefreshProfileScreenEventImplCopyWithImpl<$Res>
    extends _$ProfileScreenEventCopyWithImpl<$Res,
        _$RefreshProfileScreenEventImpl>
    implements _$$RefreshProfileScreenEventImplCopyWith<$Res> {
  __$$RefreshProfileScreenEventImplCopyWithImpl(
      _$RefreshProfileScreenEventImpl _value,
      $Res Function(_$RefreshProfileScreenEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$RefreshProfileScreenEventImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as CustomUserJson,
    ));
  }

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomUserJsonCopyWith<$Res> get profile {
    return $CustomUserJsonCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$RefreshProfileScreenEventImpl implements _RefreshProfileScreenEvent {
  const _$RefreshProfileScreenEventImpl(this.profile);

  @override
  final CustomUserJson profile;

  @override
  String toString() {
    return 'ProfileScreenEvent.refresh(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshProfileScreenEventImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshProfileScreenEventImplCopyWith<_$RefreshProfileScreenEventImpl>
      get copyWith => __$$RefreshProfileScreenEventImplCopyWithImpl<
          _$RefreshProfileScreenEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(CustomUserJson profile) refresh,
    required TResult Function(String message) error,
  }) {
    return refresh(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(CustomUserJson profile)? refresh,
    TResult? Function(String message)? error,
  }) {
    return refresh?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(CustomUserJson profile)? refresh,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProfileScreenEvent value) loaded,
    required TResult Function(_RefreshProfileScreenEvent value) refresh,
    required TResult Function(_ErrorProfileScreenEvent value) error,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProfileScreenEvent value)? loaded,
    TResult? Function(_RefreshProfileScreenEvent value)? refresh,
    TResult? Function(_ErrorProfileScreenEvent value)? error,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProfileScreenEvent value)? loaded,
    TResult Function(_RefreshProfileScreenEvent value)? refresh,
    TResult Function(_ErrorProfileScreenEvent value)? error,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _RefreshProfileScreenEvent implements ProfileScreenEvent {
  const factory _RefreshProfileScreenEvent(final CustomUserJson profile) =
      _$RefreshProfileScreenEventImpl;

  CustomUserJson get profile;

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshProfileScreenEventImplCopyWith<_$RefreshProfileScreenEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorProfileScreenEventImplCopyWith<$Res> {
  factory _$$ErrorProfileScreenEventImplCopyWith(
          _$ErrorProfileScreenEventImpl value,
          $Res Function(_$ErrorProfileScreenEventImpl) then) =
      __$$ErrorProfileScreenEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorProfileScreenEventImplCopyWithImpl<$Res>
    extends _$ProfileScreenEventCopyWithImpl<$Res,
        _$ErrorProfileScreenEventImpl>
    implements _$$ErrorProfileScreenEventImplCopyWith<$Res> {
  __$$ErrorProfileScreenEventImplCopyWithImpl(
      _$ErrorProfileScreenEventImpl _value,
      $Res Function(_$ErrorProfileScreenEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorProfileScreenEventImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorProfileScreenEventImpl implements _ErrorProfileScreenEvent {
  const _$ErrorProfileScreenEventImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileScreenEvent.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProfileScreenEventImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProfileScreenEventImplCopyWith<_$ErrorProfileScreenEventImpl>
      get copyWith => __$$ErrorProfileScreenEventImplCopyWithImpl<
          _$ErrorProfileScreenEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(CustomUserJson profile) refresh,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(CustomUserJson profile)? refresh,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(CustomUserJson profile)? refresh,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProfileScreenEvent value) loaded,
    required TResult Function(_RefreshProfileScreenEvent value) refresh,
    required TResult Function(_ErrorProfileScreenEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProfileScreenEvent value)? loaded,
    TResult? Function(_RefreshProfileScreenEvent value)? refresh,
    TResult? Function(_ErrorProfileScreenEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProfileScreenEvent value)? loaded,
    TResult Function(_RefreshProfileScreenEvent value)? refresh,
    TResult Function(_ErrorProfileScreenEvent value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorProfileScreenEvent implements ProfileScreenEvent {
  const factory _ErrorProfileScreenEvent(final String message) =
      _$ErrorProfileScreenEventImpl;

  String get message;

  /// Create a copy of ProfileScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorProfileScreenEventImplCopyWith<_$ErrorProfileScreenEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingProfileScreenState value) loading,
    required TResult Function(_LoadedProfileScreenState value) loaded,
    required TResult Function(_ErrorProfileScreenState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingProfileScreenState value)? loading,
    TResult? Function(_LoadedProfileScreenState value)? loaded,
    TResult? Function(_ErrorProfileScreenState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingProfileScreenState value)? loading,
    TResult Function(_LoadedProfileScreenState value)? loaded,
    TResult Function(_ErrorProfileScreenState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenStateCopyWith<$Res> {
  factory $ProfileScreenStateCopyWith(
          ProfileScreenState value, $Res Function(ProfileScreenState) then) =
      _$ProfileScreenStateCopyWithImpl<$Res, ProfileScreenState>;
}

/// @nodoc
class _$ProfileScreenStateCopyWithImpl<$Res, $Val extends ProfileScreenState>
    implements $ProfileScreenStateCopyWith<$Res> {
  _$ProfileScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingProfileScreenStateImplCopyWith<$Res> {
  factory _$$LoadingProfileScreenStateImplCopyWith(
          _$LoadingProfileScreenStateImpl value,
          $Res Function(_$LoadingProfileScreenStateImpl) then) =
      __$$LoadingProfileScreenStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingProfileScreenStateImplCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res,
        _$LoadingProfileScreenStateImpl>
    implements _$$LoadingProfileScreenStateImplCopyWith<$Res> {
  __$$LoadingProfileScreenStateImplCopyWithImpl(
      _$LoadingProfileScreenStateImpl _value,
      $Res Function(_$LoadingProfileScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingProfileScreenStateImpl implements _LoadingProfileScreenState {
  const _$LoadingProfileScreenStateImpl();

  @override
  String toString() {
    return 'ProfileScreenState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingProfileScreenStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_LoadingProfileScreenState value) loading,
    required TResult Function(_LoadedProfileScreenState value) loaded,
    required TResult Function(_ErrorProfileScreenState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingProfileScreenState value)? loading,
    TResult? Function(_LoadedProfileScreenState value)? loaded,
    TResult? Function(_ErrorProfileScreenState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingProfileScreenState value)? loading,
    TResult Function(_LoadedProfileScreenState value)? loaded,
    TResult Function(_ErrorProfileScreenState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingProfileScreenState implements ProfileScreenState {
  const factory _LoadingProfileScreenState() = _$LoadingProfileScreenStateImpl;
}

/// @nodoc
abstract class _$$LoadedProfileScreenStateImplCopyWith<$Res> {
  factory _$$LoadedProfileScreenStateImplCopyWith(
          _$LoadedProfileScreenStateImpl value,
          $Res Function(_$LoadedProfileScreenStateImpl) then) =
      __$$LoadedProfileScreenStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomUserJson profile});

  $CustomUserJsonCopyWith<$Res> get profile;
}

/// @nodoc
class __$$LoadedProfileScreenStateImplCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res,
        _$LoadedProfileScreenStateImpl>
    implements _$$LoadedProfileScreenStateImplCopyWith<$Res> {
  __$$LoadedProfileScreenStateImplCopyWithImpl(
      _$LoadedProfileScreenStateImpl _value,
      $Res Function(_$LoadedProfileScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$LoadedProfileScreenStateImpl(
      null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as CustomUserJson,
    ));
  }

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomUserJsonCopyWith<$Res> get profile {
    return $CustomUserJsonCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$LoadedProfileScreenStateImpl implements _LoadedProfileScreenState {
  const _$LoadedProfileScreenStateImpl(this.profile);

  @override
  final CustomUserJson profile;

  @override
  String toString() {
    return 'ProfileScreenState.loaded(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedProfileScreenStateImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedProfileScreenStateImplCopyWith<_$LoadedProfileScreenStateImpl>
      get copyWith => __$$LoadedProfileScreenStateImplCopyWithImpl<
          _$LoadedProfileScreenStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingProfileScreenState value) loading,
    required TResult Function(_LoadedProfileScreenState value) loaded,
    required TResult Function(_ErrorProfileScreenState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingProfileScreenState value)? loading,
    TResult? Function(_LoadedProfileScreenState value)? loaded,
    TResult? Function(_ErrorProfileScreenState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingProfileScreenState value)? loading,
    TResult Function(_LoadedProfileScreenState value)? loaded,
    TResult Function(_ErrorProfileScreenState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedProfileScreenState implements ProfileScreenState {
  const factory _LoadedProfileScreenState(final CustomUserJson profile) =
      _$LoadedProfileScreenStateImpl;

  CustomUserJson get profile;

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedProfileScreenStateImplCopyWith<_$LoadedProfileScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorProfileScreenStateImplCopyWith<$Res> {
  factory _$$ErrorProfileScreenStateImplCopyWith(
          _$ErrorProfileScreenStateImpl value,
          $Res Function(_$ErrorProfileScreenStateImpl) then) =
      __$$ErrorProfileScreenStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorProfileScreenStateImplCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res,
        _$ErrorProfileScreenStateImpl>
    implements _$$ErrorProfileScreenStateImplCopyWith<$Res> {
  __$$ErrorProfileScreenStateImplCopyWithImpl(
      _$ErrorProfileScreenStateImpl _value,
      $Res Function(_$ErrorProfileScreenStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorProfileScreenStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorProfileScreenStateImpl implements _ErrorProfileScreenState {
  const _$ErrorProfileScreenStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileScreenState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProfileScreenStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProfileScreenStateImplCopyWith<_$ErrorProfileScreenStateImpl>
      get copyWith => __$$ErrorProfileScreenStateImplCopyWithImpl<
          _$ErrorProfileScreenStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(CustomUserJson profile) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(CustomUserJson profile)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(CustomUserJson profile)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingProfileScreenState value) loading,
    required TResult Function(_LoadedProfileScreenState value) loaded,
    required TResult Function(_ErrorProfileScreenState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingProfileScreenState value)? loading,
    TResult? Function(_LoadedProfileScreenState value)? loaded,
    TResult? Function(_ErrorProfileScreenState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingProfileScreenState value)? loading,
    TResult Function(_LoadedProfileScreenState value)? loaded,
    TResult Function(_ErrorProfileScreenState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorProfileScreenState implements ProfileScreenState {
  const factory _ErrorProfileScreenState(final String message) =
      _$ErrorProfileScreenStateImpl;

  String get message;

  /// Create a copy of ProfileScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorProfileScreenStateImplCopyWith<_$ErrorProfileScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
