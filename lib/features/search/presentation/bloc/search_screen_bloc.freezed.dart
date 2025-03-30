// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? from, double? to,
            List<Category>? categories, String? status)
        loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSearch value) loading,
    required TResult Function(_LoadedSearch value) loaded,
    required TResult Function(_ErrorSearch value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingSearch value)? loading,
    TResult? Function(_LoadedSearch value)? loaded,
    TResult? Function(_ErrorSearch value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSearch value)? loading,
    TResult Function(_LoadedSearch value)? loaded,
    TResult Function(_ErrorSearch value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenEventCopyWith<$Res> {
  factory $SearchScreenEventCopyWith(
          SearchScreenEvent value, $Res Function(SearchScreenEvent) then) =
      _$SearchScreenEventCopyWithImpl<$Res, SearchScreenEvent>;
}

/// @nodoc
class _$SearchScreenEventCopyWithImpl<$Res, $Val extends SearchScreenEvent>
    implements $SearchScreenEventCopyWith<$Res> {
  _$SearchScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingSearchImplCopyWith<$Res> {
  factory _$$LoadingSearchImplCopyWith(
          _$LoadingSearchImpl value, $Res Function(_$LoadingSearchImpl) then) =
      __$$LoadingSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double? from, double? to, List<Category>? categories, String? status});
}

/// @nodoc
class __$$LoadingSearchImplCopyWithImpl<$Res>
    extends _$SearchScreenEventCopyWithImpl<$Res, _$LoadingSearchImpl>
    implements _$$LoadingSearchImplCopyWith<$Res> {
  __$$LoadingSearchImplCopyWithImpl(
      _$LoadingSearchImpl _value, $Res Function(_$LoadingSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? categories = freezed,
    Object? status = freezed,
  }) {
    return _then(_$LoadingSearchImpl(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as double?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as double?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadingSearchImpl implements _LoadingSearch {
  const _$LoadingSearchImpl(
      {this.from, this.to, final List<Category>? categories, this.status})
      : _categories = categories;

  @override
  final double? from;
  @override
  final double? to;
  final List<Category>? _categories;
  @override
  List<Category>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'SearchScreenEvent.loading(from: $from, to: $to, categories: $categories, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingSearchImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_categories), status);

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingSearchImplCopyWith<_$LoadingSearchImpl> get copyWith =>
      __$$LoadingSearchImplCopyWithImpl<_$LoadingSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? from, double? to,
            List<Category>? categories, String? status)
        loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading(from, to, categories, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(from, to, categories, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(from, to, categories, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSearch value) loading,
    required TResult Function(_LoadedSearch value) loaded,
    required TResult Function(_ErrorSearch value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingSearch value)? loading,
    TResult? Function(_LoadedSearch value)? loaded,
    TResult? Function(_ErrorSearch value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSearch value)? loading,
    TResult Function(_LoadedSearch value)? loaded,
    TResult Function(_ErrorSearch value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingSearch implements SearchScreenEvent {
  const factory _LoadingSearch(
      {final double? from,
      final double? to,
      final List<Category>? categories,
      final String? status}) = _$LoadingSearchImpl;

  double? get from;
  double? get to;
  List<Category>? get categories;
  String? get status;

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingSearchImplCopyWith<_$LoadingSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedSearchImplCopyWith<$Res> {
  factory _$$LoadedSearchImplCopyWith(
          _$LoadedSearchImpl value, $Res Function(_$LoadedSearchImpl) then) =
      __$$LoadedSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Product> products,
      int quantity,
      List<Category> enabled,
      Map<Category, List<Category>> struct,
      String? status});
}

/// @nodoc
class __$$LoadedSearchImplCopyWithImpl<$Res>
    extends _$SearchScreenEventCopyWithImpl<$Res, _$LoadedSearchImpl>
    implements _$$LoadedSearchImplCopyWith<$Res> {
  __$$LoadedSearchImplCopyWithImpl(
      _$LoadedSearchImpl _value, $Res Function(_$LoadedSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? quantity = null,
    Object? enabled = null,
    Object? struct = null,
    Object? status = freezed,
  }) {
    return _then(_$LoadedSearchImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _value._enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      struct: null == struct
          ? _value._struct
          : struct // ignore: cast_nullable_to_non_nullable
              as Map<Category, List<Category>>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedSearchImpl implements _LoadedSearch {
  const _$LoadedSearchImpl(
      {required final List<Product> products,
      required this.quantity,
      required final List<Category> enabled,
      required final Map<Category, List<Category>> struct,
      required this.status})
      : _products = products,
        _enabled = enabled,
        _struct = struct;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int quantity;
  final List<Category> _enabled;
  @override
  List<Category> get enabled {
    if (_enabled is EqualUnmodifiableListView) return _enabled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabled);
  }

  final Map<Category, List<Category>> _struct;
  @override
  Map<Category, List<Category>> get struct {
    if (_struct is EqualUnmodifiableMapView) return _struct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_struct);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'SearchScreenEvent.loaded(products: $products, quantity: $quantity, enabled: $enabled, struct: $struct, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedSearchImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other._enabled, _enabled) &&
            const DeepCollectionEquality().equals(other._struct, _struct) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      quantity,
      const DeepCollectionEquality().hash(_enabled),
      const DeepCollectionEquality().hash(_struct),
      status);

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedSearchImplCopyWith<_$LoadedSearchImpl> get copyWith =>
      __$$LoadedSearchImplCopyWithImpl<_$LoadedSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? from, double? to,
            List<Category>? categories, String? status)
        loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(products, quantity, enabled, struct, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(products, quantity, enabled, struct, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products, quantity, enabled, struct, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSearch value) loading,
    required TResult Function(_LoadedSearch value) loaded,
    required TResult Function(_ErrorSearch value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingSearch value)? loading,
    TResult? Function(_LoadedSearch value)? loaded,
    TResult? Function(_ErrorSearch value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSearch value)? loading,
    TResult Function(_LoadedSearch value)? loaded,
    TResult Function(_ErrorSearch value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedSearch implements SearchScreenEvent {
  const factory _LoadedSearch(
      {required final List<Product> products,
      required final int quantity,
      required final List<Category> enabled,
      required final Map<Category, List<Category>> struct,
      required final String? status}) = _$LoadedSearchImpl;

  List<Product> get products;
  int get quantity;
  List<Category> get enabled;
  Map<Category, List<Category>> get struct;
  String? get status;

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedSearchImplCopyWith<_$LoadedSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorSearchImplCopyWith<$Res> {
  factory _$$ErrorSearchImplCopyWith(
          _$ErrorSearchImpl value, $Res Function(_$ErrorSearchImpl) then) =
      __$$ErrorSearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorSearchImplCopyWithImpl<$Res>
    extends _$SearchScreenEventCopyWithImpl<$Res, _$ErrorSearchImpl>
    implements _$$ErrorSearchImplCopyWith<$Res> {
  __$$ErrorSearchImplCopyWithImpl(
      _$ErrorSearchImpl _value, $Res Function(_$ErrorSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorSearchImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorSearchImpl implements _ErrorSearch {
  const _$ErrorSearchImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchScreenEvent.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorSearchImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorSearchImplCopyWith<_$ErrorSearchImpl> get copyWith =>
      __$$ErrorSearchImplCopyWithImpl<_$ErrorSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double? from, double? to,
            List<Category>? categories, String? status)
        loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double? from, double? to, List<Category>? categories,
            String? status)?
        loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingSearch value) loading,
    required TResult Function(_LoadedSearch value) loaded,
    required TResult Function(_ErrorSearch value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingSearch value)? loading,
    TResult? Function(_LoadedSearch value)? loaded,
    TResult? Function(_ErrorSearch value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingSearch value)? loading,
    TResult Function(_LoadedSearch value)? loaded,
    TResult Function(_ErrorSearch value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSearch implements SearchScreenEvent {
  const factory _ErrorSearch({required final String error}) = _$ErrorSearchImpl;

  String get error;

  /// Create a copy of SearchScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorSearchImplCopyWith<_$ErrorSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScreenStateCopyWith<$Res> {
  factory $SearchScreenStateCopyWith(
          SearchScreenState value, $Res Function(SearchScreenState) then) =
      _$SearchScreenStateCopyWithImpl<$Res, SearchScreenState>;
}

/// @nodoc
class _$SearchScreenStateCopyWithImpl<$Res, $Val extends SearchScreenState>
    implements $SearchScreenStateCopyWith<$Res> {
  _$SearchScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingStateImplCopyWith<$Res> {
  factory _$$LoadingStateImplCopyWith(
          _$LoadingStateImpl value, $Res Function(_$LoadingStateImpl) then) =
      __$$LoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateImplCopyWithImpl<$Res>
    extends _$SearchScreenStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'SearchScreenState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements SearchScreenState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Product> products,
      int quantity,
      List<Category> enabled,
      Map<Category, List<Category>> struct,
      String? status});
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$SearchScreenStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? quantity = null,
    Object? enabled = null,
    Object? struct = null,
    Object? status = freezed,
  }) {
    return _then(_$LoadedStateImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _value._enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      struct: null == struct
          ? _value._struct
          : struct // ignore: cast_nullable_to_non_nullable
              as Map<Category, List<Category>>,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedStateImpl implements _LoadedState {
  const _$LoadedStateImpl(
      {required final List<Product> products,
      required this.quantity,
      required final List<Category> enabled,
      required final Map<Category, List<Category>> struct,
      this.status})
      : _products = products,
        _enabled = enabled,
        _struct = struct;

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int quantity;
  final List<Category> _enabled;
  @override
  List<Category> get enabled {
    if (_enabled is EqualUnmodifiableListView) return _enabled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabled);
  }

  final Map<Category, List<Category>> _struct;
  @override
  Map<Category, List<Category>> get struct {
    if (_struct is EqualUnmodifiableMapView) return _struct;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_struct);
  }

  @override
  final String? status;

  @override
  String toString() {
    return 'SearchScreenState.loaded(products: $products, quantity: $quantity, enabled: $enabled, struct: $struct, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other._enabled, _enabled) &&
            const DeepCollectionEquality().equals(other._struct, _struct) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      quantity,
      const DeepCollectionEquality().hash(_enabled),
      const DeepCollectionEquality().hash(_struct),
      status);

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      __$$LoadedStateImplCopyWithImpl<_$LoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(products, quantity, enabled, struct, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(products, quantity, enabled, struct, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products, quantity, enabled, struct, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedState implements SearchScreenState {
  const factory _LoadedState(
      {required final List<Product> products,
      required final int quantity,
      required final List<Category> enabled,
      required final Map<Category, List<Category>> struct,
      final String? status}) = _$LoadedStateImpl;

  List<Product> get products;
  int get quantity;
  List<Category> get enabled;
  Map<Category, List<Category>> get struct;
  String? get status;

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedStateImplCopyWith<_$LoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$SearchScreenStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchScreenState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(
            List<Product> products,
            int quantity,
            List<Category> enabled,
            Map<Category, List<Category>> struct,
            String? status)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements SearchScreenState {
  const factory _ErrorState({required final String error}) = _$ErrorStateImpl;

  String get error;

  /// Create a copy of SearchScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
