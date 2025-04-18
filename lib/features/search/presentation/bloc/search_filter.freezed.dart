// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchFilter {
  Category? get enabled => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Create a copy of SearchFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchFilterCopyWith<SearchFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFilterCopyWith<$Res> {
  factory $SearchFilterCopyWith(
          SearchFilter value, $Res Function(SearchFilter) then) =
      _$SearchFilterCopyWithImpl<$Res, SearchFilter>;
  @useResult
  $Res call({Category? enabled, String? status});

  $CategoryCopyWith<$Res>? get enabled;
}

/// @nodoc
class _$SearchFilterCopyWithImpl<$Res, $Val extends SearchFilter>
    implements $SearchFilterCopyWith<$Res> {
  _$SearchFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as Category?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SearchFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get enabled {
    if (_value.enabled == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.enabled!, (value) {
      return _then(_value.copyWith(enabled: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchFilterImplCopyWith<$Res>
    implements $SearchFilterCopyWith<$Res> {
  factory _$$SearchFilterImplCopyWith(
          _$SearchFilterImpl value, $Res Function(_$SearchFilterImpl) then) =
      __$$SearchFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Category? enabled, String? status});

  @override
  $CategoryCopyWith<$Res>? get enabled;
}

/// @nodoc
class __$$SearchFilterImplCopyWithImpl<$Res>
    extends _$SearchFilterCopyWithImpl<$Res, _$SearchFilterImpl>
    implements _$$SearchFilterImplCopyWith<$Res> {
  __$$SearchFilterImplCopyWithImpl(
      _$SearchFilterImpl _value, $Res Function(_$SearchFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
    Object? status = freezed,
  }) {
    return _then(_$SearchFilterImpl(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as Category?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchFilterImpl implements _SearchFilter {
  const _$SearchFilterImpl({this.enabled, this.status});

  @override
  final Category? enabled;
  @override
  final String? status;

  @override
  String toString() {
    return 'SearchFilter(enabled: $enabled, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFilterImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled, status);

  /// Create a copy of SearchFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFilterImplCopyWith<_$SearchFilterImpl> get copyWith =>
      __$$SearchFilterImplCopyWithImpl<_$SearchFilterImpl>(this, _$identity);
}

abstract class _SearchFilter implements SearchFilter {
  const factory _SearchFilter({final Category? enabled, final String? status}) =
      _$SearchFilterImpl;

  @override
  Category? get enabled;
  @override
  String? get status;

  /// Create a copy of SearchFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFilterImplCopyWith<_$SearchFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
