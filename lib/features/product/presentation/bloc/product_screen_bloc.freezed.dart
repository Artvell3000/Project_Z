// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        productLoaded,
    required TResult Function(String message) productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        productLoaded,
    TResult? Function(String message)? productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)? productLoaded,
    TResult Function(String message)? productError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialLoad value) loading,
    required TResult Function(_ProductLoaded value) productLoaded,
    required TResult Function(_ProductError value) productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoad value)? loading,
    TResult? Function(_ProductLoaded value)? productLoaded,
    TResult? Function(_ProductError value)? productError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoad value)? loading,
    TResult Function(_ProductLoaded value)? productLoaded,
    TResult Function(_ProductError value)? productError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductScreenEventCopyWith<$Res> {
  factory $ProductScreenEventCopyWith(
          ProductScreenEvent value, $Res Function(ProductScreenEvent) then) =
      _$ProductScreenEventCopyWithImpl<$Res, ProductScreenEvent>;
}

/// @nodoc
class _$ProductScreenEventCopyWithImpl<$Res, $Val extends ProductScreenEvent>
    implements $ProductScreenEventCopyWith<$Res> {
  _$ProductScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialLoadImplCopyWith<$Res> {
  factory _$$InitialLoadImplCopyWith(
          _$InitialLoadImpl value, $Res Function(_$InitialLoadImpl) then) =
      __$$InitialLoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialLoadImplCopyWithImpl<$Res>
    extends _$ProductScreenEventCopyWithImpl<$Res, _$InitialLoadImpl>
    implements _$$InitialLoadImplCopyWith<$Res> {
  __$$InitialLoadImplCopyWithImpl(
      _$InitialLoadImpl _value, $Res Function(_$InitialLoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialLoadImpl implements _InitialLoad {
  const _$InitialLoadImpl();

  @override
  String toString() {
    return 'ProductScreenEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialLoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        productLoaded,
    required TResult Function(String message) productError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        productLoaded,
    TResult? Function(String message)? productError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)? productLoaded,
    TResult Function(String message)? productError,
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
    required TResult Function(_InitialLoad value) loading,
    required TResult Function(_ProductLoaded value) productLoaded,
    required TResult Function(_ProductError value) productError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoad value)? loading,
    TResult? Function(_ProductLoaded value)? productLoaded,
    TResult? Function(_ProductError value)? productError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoad value)? loading,
    TResult Function(_ProductLoaded value)? productLoaded,
    TResult Function(_ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _InitialLoad implements ProductScreenEvent {
  const factory _InitialLoad() = _$InitialLoadImpl;
}

/// @nodoc
abstract class _$$ProductLoadedImplCopyWith<$Res> {
  factory _$$ProductLoadedImplCopyWith(
          _$ProductLoadedImpl value, $Res Function(_$ProductLoadedImpl) then) =
      __$$ProductLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, List<Product> newProducts});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductLoadedImplCopyWithImpl<$Res>
    extends _$ProductScreenEventCopyWithImpl<$Res, _$ProductLoadedImpl>
    implements _$$ProductLoadedImplCopyWith<$Res> {
  __$$ProductLoadedImplCopyWithImpl(
      _$ProductLoadedImpl _value, $Res Function(_$ProductLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? newProducts = null,
  }) {
    return _then(_$ProductLoadedImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == newProducts
          ? _value._newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$ProductLoadedImpl implements _ProductLoaded {
  const _$ProductLoadedImpl(this.product, final List<Product> newProducts)
      : _newProducts = newProducts;

  @override
  final Product product;
  final List<Product> _newProducts;
  @override
  List<Product> get newProducts {
    if (_newProducts is EqualUnmodifiableListView) return _newProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newProducts);
  }

  @override
  String toString() {
    return 'ProductScreenEvent.productLoaded(product: $product, newProducts: $newProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLoadedImpl &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._newProducts, _newProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, product, const DeepCollectionEquality().hash(_newProducts));

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLoadedImplCopyWith<_$ProductLoadedImpl> get copyWith =>
      __$$ProductLoadedImplCopyWithImpl<_$ProductLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        productLoaded,
    required TResult Function(String message) productError,
  }) {
    return productLoaded(product, newProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        productLoaded,
    TResult? Function(String message)? productError,
  }) {
    return productLoaded?.call(product, newProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)? productLoaded,
    TResult Function(String message)? productError,
    required TResult orElse(),
  }) {
    if (productLoaded != null) {
      return productLoaded(product, newProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialLoad value) loading,
    required TResult Function(_ProductLoaded value) productLoaded,
    required TResult Function(_ProductError value) productError,
  }) {
    return productLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoad value)? loading,
    TResult? Function(_ProductLoaded value)? productLoaded,
    TResult? Function(_ProductError value)? productError,
  }) {
    return productLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoad value)? loading,
    TResult Function(_ProductLoaded value)? productLoaded,
    TResult Function(_ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (productLoaded != null) {
      return productLoaded(this);
    }
    return orElse();
  }
}

abstract class _ProductLoaded implements ProductScreenEvent {
  const factory _ProductLoaded(
          final Product product, final List<Product> newProducts) =
      _$ProductLoadedImpl;

  Product get product;
  List<Product> get newProducts;

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductLoadedImplCopyWith<_$ProductLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductErrorImplCopyWith<$Res> {
  factory _$$ProductErrorImplCopyWith(
          _$ProductErrorImpl value, $Res Function(_$ProductErrorImpl) then) =
      __$$ProductErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ProductErrorImplCopyWithImpl<$Res>
    extends _$ProductScreenEventCopyWithImpl<$Res, _$ProductErrorImpl>
    implements _$$ProductErrorImplCopyWith<$Res> {
  __$$ProductErrorImplCopyWithImpl(
      _$ProductErrorImpl _value, $Res Function(_$ProductErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ProductErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductErrorImpl implements _ProductError {
  const _$ProductErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ProductScreenEvent.productError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductErrorImplCopyWith<_$ProductErrorImpl> get copyWith =>
      __$$ProductErrorImplCopyWithImpl<_$ProductErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        productLoaded,
    required TResult Function(String message) productError,
  }) {
    return productError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        productLoaded,
    TResult? Function(String message)? productError,
  }) {
    return productError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)? productLoaded,
    TResult Function(String message)? productError,
    required TResult orElse(),
  }) {
    if (productError != null) {
      return productError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialLoad value) loading,
    required TResult Function(_ProductLoaded value) productLoaded,
    required TResult Function(_ProductError value) productError,
  }) {
    return productError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoad value)? loading,
    TResult? Function(_ProductLoaded value)? productLoaded,
    TResult? Function(_ProductError value)? productError,
  }) {
    return productError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoad value)? loading,
    TResult Function(_ProductLoaded value)? productLoaded,
    TResult Function(_ProductError value)? productError,
    required TResult orElse(),
  }) {
    if (productError != null) {
      return productError(this);
    }
    return orElse();
  }
}

abstract class _ProductError implements ProductScreenEvent {
  const factory _ProductError(final String message) = _$ProductErrorImpl;

  String get message;

  /// Create a copy of ProductScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductErrorImplCopyWith<_$ProductErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        loadedProducts,
    required TResult Function(String productError) errorProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult? Function(String productError)? errorProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult Function(String productError)? errorProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedProduct value) loadedProducts,
    required TResult Function(_ErrorProduct value) errorProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedProduct value)? loadedProducts,
    TResult? Function(_ErrorProduct value)? errorProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedProduct value)? loadedProducts,
    TResult Function(_ErrorProduct value)? errorProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductScreenStateCopyWith<$Res> {
  factory $ProductScreenStateCopyWith(
          ProductScreenState value, $Res Function(ProductScreenState) then) =
      _$ProductScreenStateCopyWithImpl<$Res, ProductScreenState>;
}

/// @nodoc
class _$ProductScreenStateCopyWithImpl<$Res, $Val extends ProductScreenState>
    implements $ProductScreenStateCopyWith<$Res> {
  _$ProductScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductScreenStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductScreenState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        loadedProducts,
    required TResult Function(String productError) errorProducts,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult? Function(String productError)? errorProducts,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult Function(String productError)? errorProducts,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedProduct value) loadedProducts,
    required TResult Function(_ErrorProduct value) errorProducts,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedProduct value)? loadedProducts,
    TResult? Function(_ErrorProduct value)? errorProducts,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedProduct value)? loadedProducts,
    TResult Function(_ErrorProduct value)? errorProducts,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductScreenState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedProductImplCopyWith<$Res> {
  factory _$$LoadedProductImplCopyWith(
          _$LoadedProductImpl value, $Res Function(_$LoadedProductImpl) then) =
      __$$LoadedProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, List<Product> newProducts});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$LoadedProductImplCopyWithImpl<$Res>
    extends _$ProductScreenStateCopyWithImpl<$Res, _$LoadedProductImpl>
    implements _$$LoadedProductImplCopyWith<$Res> {
  __$$LoadedProductImplCopyWithImpl(
      _$LoadedProductImpl _value, $Res Function(_$LoadedProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? newProducts = null,
  }) {
    return _then(_$LoadedProductImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      newProducts: null == newProducts
          ? _value._newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$LoadedProductImpl implements _LoadedProduct {
  const _$LoadedProductImpl(
      {required this.product, required final List<Product> newProducts})
      : _newProducts = newProducts;

  @override
  final Product product;
  final List<Product> _newProducts;
  @override
  List<Product> get newProducts {
    if (_newProducts is EqualUnmodifiableListView) return _newProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newProducts);
  }

  @override
  String toString() {
    return 'ProductScreenState.loadedProducts(product: $product, newProducts: $newProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._newProducts, _newProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, product, const DeepCollectionEquality().hash(_newProducts));

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedProductImplCopyWith<_$LoadedProductImpl> get copyWith =>
      __$$LoadedProductImplCopyWithImpl<_$LoadedProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        loadedProducts,
    required TResult Function(String productError) errorProducts,
  }) {
    return loadedProducts(product, newProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult? Function(String productError)? errorProducts,
  }) {
    return loadedProducts?.call(product, newProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult Function(String productError)? errorProducts,
    required TResult orElse(),
  }) {
    if (loadedProducts != null) {
      return loadedProducts(product, newProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedProduct value) loadedProducts,
    required TResult Function(_ErrorProduct value) errorProducts,
  }) {
    return loadedProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedProduct value)? loadedProducts,
    TResult? Function(_ErrorProduct value)? errorProducts,
  }) {
    return loadedProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedProduct value)? loadedProducts,
    TResult Function(_ErrorProduct value)? errorProducts,
    required TResult orElse(),
  }) {
    if (loadedProducts != null) {
      return loadedProducts(this);
    }
    return orElse();
  }
}

abstract class _LoadedProduct implements ProductScreenState {
  const factory _LoadedProduct(
      {required final Product product,
      required final List<Product> newProducts}) = _$LoadedProductImpl;

  Product get product;
  List<Product> get newProducts;

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedProductImplCopyWith<_$LoadedProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorProductImplCopyWith<$Res> {
  factory _$$ErrorProductImplCopyWith(
          _$ErrorProductImpl value, $Res Function(_$ErrorProductImpl) then) =
      __$$ErrorProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productError});
}

/// @nodoc
class __$$ErrorProductImplCopyWithImpl<$Res>
    extends _$ProductScreenStateCopyWithImpl<$Res, _$ErrorProductImpl>
    implements _$$ErrorProductImplCopyWith<$Res> {
  __$$ErrorProductImplCopyWithImpl(
      _$ErrorProductImpl _value, $Res Function(_$ErrorProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productError = null,
  }) {
    return _then(_$ErrorProductImpl(
      productError: null == productError
          ? _value.productError
          : productError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorProductImpl implements _ErrorProduct {
  const _$ErrorProductImpl({required this.productError});

  @override
  final String productError;

  @override
  String toString() {
    return 'ProductScreenState.errorProducts(productError: $productError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorProductImpl &&
            (identical(other.productError, productError) ||
                other.productError == productError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productError);

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorProductImplCopyWith<_$ErrorProductImpl> get copyWith =>
      __$$ErrorProductImplCopyWithImpl<_$ErrorProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Product product, List<Product> newProducts)
        loadedProducts,
    required TResult Function(String productError) errorProducts,
  }) {
    return errorProducts(productError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult? Function(String productError)? errorProducts,
  }) {
    return errorProducts?.call(productError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Product product, List<Product> newProducts)?
        loadedProducts,
    TResult Function(String productError)? errorProducts,
    required TResult orElse(),
  }) {
    if (errorProducts != null) {
      return errorProducts(productError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadedProduct value) loadedProducts,
    required TResult Function(_ErrorProduct value) errorProducts,
  }) {
    return errorProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoadedProduct value)? loadedProducts,
    TResult? Function(_ErrorProduct value)? errorProducts,
  }) {
    return errorProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadedProduct value)? loadedProducts,
    TResult Function(_ErrorProduct value)? errorProducts,
    required TResult orElse(),
  }) {
    if (errorProducts != null) {
      return errorProducts(this);
    }
    return orElse();
  }
}

abstract class _ErrorProduct implements ProductScreenState {
  const factory _ErrorProduct({required final String productError}) =
      _$ErrorProductImpl;

  String get productError;

  /// Create a copy of ProductScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorProductImplCopyWith<_$ErrorProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
