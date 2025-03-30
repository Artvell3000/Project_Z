// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductList productList, CategoryList categoryList)
        loaded,
    required TResult Function(String error) loadedWithError,
    required TResult Function(String status) searchByStatus,
    required TResult Function(
            double? from, double? to, List<Category>? categories)
        searchByCategoriesAndPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult? Function(String error)? loadedWithError,
    TResult? Function(String status)? searchByStatus,
    TResult? Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult Function(String error)? loadedWithError,
    TResult Function(String status)? searchByStatus,
    TResult Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithError value) loadedWithError,
    required TResult Function(_searchByStatus value) searchByStatus,
    required TResult Function(_searchByCategoriesAndPrice value)
        searchByCategoriesAndPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithError value)? loadedWithError,
    TResult? Function(_searchByStatus value)? searchByStatus,
    TResult? Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithError value)? loadedWithError,
    TResult Function(_searchByStatus value)? searchByStatus,
    TResult Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductList productList, CategoryList categoryList});

  $ProductListCopyWith<$Res> get productList;
  $CategoryListCopyWith<$Res> get categoryList;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productList = null,
    Object? categoryList = null,
  }) {
    return _then(_$LoadedImpl(
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as ProductList,
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as CategoryList,
    ));
  }

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductListCopyWith<$Res> get productList {
    return $ProductListCopyWith<$Res>(_value.productList, (value) {
      return _then(_value.copyWith(productList: value));
    });
  }

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryListCopyWith<$Res> get categoryList {
    return $CategoryListCopyWith<$Res>(_value.categoryList, (value) {
      return _then(_value.copyWith(categoryList: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.productList, required this.categoryList});

  @override
  final ProductList productList;
  @override
  final CategoryList categoryList;

  @override
  String toString() {
    return 'SearchEvent.loaded(productList: $productList, categoryList: $categoryList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.productList, productList) ||
                other.productList == productList) &&
            (identical(other.categoryList, categoryList) ||
                other.categoryList == categoryList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productList, categoryList);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductList productList, CategoryList categoryList)
        loaded,
    required TResult Function(String error) loadedWithError,
    required TResult Function(String status) searchByStatus,
    required TResult Function(
            double? from, double? to, List<Category>? categories)
        searchByCategoriesAndPrice,
  }) {
    return loaded(productList, categoryList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult? Function(String error)? loadedWithError,
    TResult? Function(String status)? searchByStatus,
    TResult? Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
  }) {
    return loaded?.call(productList, categoryList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult Function(String error)? loadedWithError,
    TResult Function(String status)? searchByStatus,
    TResult Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(productList, categoryList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithError value) loadedWithError,
    required TResult Function(_searchByStatus value) searchByStatus,
    required TResult Function(_searchByCategoriesAndPrice value)
        searchByCategoriesAndPrice,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithError value)? loadedWithError,
    TResult? Function(_searchByStatus value)? searchByStatus,
    TResult? Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithError value)? loadedWithError,
    TResult Function(_searchByStatus value)? searchByStatus,
    TResult Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SearchEvent {
  const factory _Loaded(
      {required final ProductList productList,
      required final CategoryList categoryList}) = _$LoadedImpl;

  ProductList get productList;
  CategoryList get categoryList;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedWithErrorImplCopyWith<$Res> {
  factory _$$LoadedWithErrorImplCopyWith(_$LoadedWithErrorImpl value,
          $Res Function(_$LoadedWithErrorImpl) then) =
      __$$LoadedWithErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$LoadedWithErrorImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$LoadedWithErrorImpl>
    implements _$$LoadedWithErrorImplCopyWith<$Res> {
  __$$LoadedWithErrorImplCopyWithImpl(
      _$LoadedWithErrorImpl _value, $Res Function(_$LoadedWithErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LoadedWithErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadedWithErrorImpl implements _LoadedWithError {
  const _$LoadedWithErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'SearchEvent.loadedWithError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedWithErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedWithErrorImplCopyWith<_$LoadedWithErrorImpl> get copyWith =>
      __$$LoadedWithErrorImplCopyWithImpl<_$LoadedWithErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductList productList, CategoryList categoryList)
        loaded,
    required TResult Function(String error) loadedWithError,
    required TResult Function(String status) searchByStatus,
    required TResult Function(
            double? from, double? to, List<Category>? categories)
        searchByCategoriesAndPrice,
  }) {
    return loadedWithError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult? Function(String error)? loadedWithError,
    TResult? Function(String status)? searchByStatus,
    TResult? Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
  }) {
    return loadedWithError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult Function(String error)? loadedWithError,
    TResult Function(String status)? searchByStatus,
    TResult Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (loadedWithError != null) {
      return loadedWithError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithError value) loadedWithError,
    required TResult Function(_searchByStatus value) searchByStatus,
    required TResult Function(_searchByCategoriesAndPrice value)
        searchByCategoriesAndPrice,
  }) {
    return loadedWithError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithError value)? loadedWithError,
    TResult? Function(_searchByStatus value)? searchByStatus,
    TResult? Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
  }) {
    return loadedWithError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithError value)? loadedWithError,
    TResult Function(_searchByStatus value)? searchByStatus,
    TResult Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (loadedWithError != null) {
      return loadedWithError(this);
    }
    return orElse();
  }
}

abstract class _LoadedWithError implements SearchEvent {
  const factory _LoadedWithError({required final String error}) =
      _$LoadedWithErrorImpl;

  String get error;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedWithErrorImplCopyWith<_$LoadedWithErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$searchByStatusImplCopyWith<$Res> {
  factory _$$searchByStatusImplCopyWith(_$searchByStatusImpl value,
          $Res Function(_$searchByStatusImpl) then) =
      __$$searchByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$searchByStatusImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$searchByStatusImpl>
    implements _$$searchByStatusImplCopyWith<$Res> {
  __$$searchByStatusImplCopyWithImpl(
      _$searchByStatusImpl _value, $Res Function(_$searchByStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$searchByStatusImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$searchByStatusImpl implements _searchByStatus {
  const _$searchByStatusImpl({required this.status});

  @override
  final String status;

  @override
  String toString() {
    return 'SearchEvent.searchByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$searchByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$searchByStatusImplCopyWith<_$searchByStatusImpl> get copyWith =>
      __$$searchByStatusImplCopyWithImpl<_$searchByStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductList productList, CategoryList categoryList)
        loaded,
    required TResult Function(String error) loadedWithError,
    required TResult Function(String status) searchByStatus,
    required TResult Function(
            double? from, double? to, List<Category>? categories)
        searchByCategoriesAndPrice,
  }) {
    return searchByStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult? Function(String error)? loadedWithError,
    TResult? Function(String status)? searchByStatus,
    TResult? Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
  }) {
    return searchByStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult Function(String error)? loadedWithError,
    TResult Function(String status)? searchByStatus,
    TResult Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (searchByStatus != null) {
      return searchByStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithError value) loadedWithError,
    required TResult Function(_searchByStatus value) searchByStatus,
    required TResult Function(_searchByCategoriesAndPrice value)
        searchByCategoriesAndPrice,
  }) {
    return searchByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithError value)? loadedWithError,
    TResult? Function(_searchByStatus value)? searchByStatus,
    TResult? Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
  }) {
    return searchByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithError value)? loadedWithError,
    TResult Function(_searchByStatus value)? searchByStatus,
    TResult Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (searchByStatus != null) {
      return searchByStatus(this);
    }
    return orElse();
  }
}

abstract class _searchByStatus implements SearchEvent {
  const factory _searchByStatus({required final String status}) =
      _$searchByStatusImpl;

  String get status;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$searchByStatusImplCopyWith<_$searchByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$searchByCategoriesAndPriceImplCopyWith<$Res> {
  factory _$$searchByCategoriesAndPriceImplCopyWith(
          _$searchByCategoriesAndPriceImpl value,
          $Res Function(_$searchByCategoriesAndPriceImpl) then) =
      __$$searchByCategoriesAndPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double? from, double? to, List<Category>? categories});
}

/// @nodoc
class __$$searchByCategoriesAndPriceImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$searchByCategoriesAndPriceImpl>
    implements _$$searchByCategoriesAndPriceImplCopyWith<$Res> {
  __$$searchByCategoriesAndPriceImplCopyWithImpl(
      _$searchByCategoriesAndPriceImpl _value,
      $Res Function(_$searchByCategoriesAndPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$searchByCategoriesAndPriceImpl(
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
    ));
  }
}

/// @nodoc

class _$searchByCategoriesAndPriceImpl implements _searchByCategoriesAndPrice {
  const _$searchByCategoriesAndPriceImpl(
      {this.from, this.to, final List<Category>? categories})
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
  String toString() {
    return 'SearchEvent.searchByCategoriesAndPrice(from: $from, to: $to, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$searchByCategoriesAndPriceImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, from, to, const DeepCollectionEquality().hash(_categories));

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$searchByCategoriesAndPriceImplCopyWith<_$searchByCategoriesAndPriceImpl>
      get copyWith => __$$searchByCategoriesAndPriceImplCopyWithImpl<
          _$searchByCategoriesAndPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductList productList, CategoryList categoryList)
        loaded,
    required TResult Function(String error) loadedWithError,
    required TResult Function(String status) searchByStatus,
    required TResult Function(
            double? from, double? to, List<Category>? categories)
        searchByCategoriesAndPrice,
  }) {
    return searchByCategoriesAndPrice(from, to, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult? Function(String error)? loadedWithError,
    TResult? Function(String status)? searchByStatus,
    TResult? Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
  }) {
    return searchByCategoriesAndPrice?.call(from, to, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductList productList, CategoryList categoryList)?
        loaded,
    TResult Function(String error)? loadedWithError,
    TResult Function(String status)? searchByStatus,
    TResult Function(double? from, double? to, List<Category>? categories)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (searchByCategoriesAndPrice != null) {
      return searchByCategoriesAndPrice(from, to, categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadedWithError value) loadedWithError,
    required TResult Function(_searchByStatus value) searchByStatus,
    required TResult Function(_searchByCategoriesAndPrice value)
        searchByCategoriesAndPrice,
  }) {
    return searchByCategoriesAndPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadedWithError value)? loadedWithError,
    TResult? Function(_searchByStatus value)? searchByStatus,
    TResult? Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
  }) {
    return searchByCategoriesAndPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadedWithError value)? loadedWithError,
    TResult Function(_searchByStatus value)? searchByStatus,
    TResult Function(_searchByCategoriesAndPrice value)?
        searchByCategoriesAndPrice,
    required TResult orElse(),
  }) {
    if (searchByCategoriesAndPrice != null) {
      return searchByCategoriesAndPrice(this);
    }
    return orElse();
  }
}

abstract class _searchByCategoriesAndPrice implements SearchEvent {
  const factory _searchByCategoriesAndPrice(
      {final double? from,
      final double? to,
      final List<Category>? categories}) = _$searchByCategoriesAndPriceImpl;

  double? get from;
  double? get to;
  List<Category>? get categories;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$searchByCategoriesAndPriceImplCopyWith<_$searchByCategoriesAndPriceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(ProductList products, CategoryList categories)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductList products, CategoryList categories)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductList products, CategoryList categories)? loaded,
    TResult Function(String message)? error,
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
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
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
    extends _$SearchStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'SearchState.loading()';
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
    required TResult Function(ProductList products, CategoryList categories)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductList products, CategoryList categories)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductList products, CategoryList categories)? loaded,
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

abstract class _LoadingState implements SearchState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$LoadedStateImplCopyWith<$Res> {
  factory _$$LoadedStateImplCopyWith(
          _$LoadedStateImpl value, $Res Function(_$LoadedStateImpl) then) =
      __$$LoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductList products, CategoryList categories});

  $ProductListCopyWith<$Res> get products;
  $CategoryListCopyWith<$Res> get categories;
}

/// @nodoc
class __$$LoadedStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$LoadedStateImpl>
    implements _$$LoadedStateImplCopyWith<$Res> {
  __$$LoadedStateImplCopyWithImpl(
      _$LoadedStateImpl _value, $Res Function(_$LoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? categories = null,
  }) {
    return _then(_$LoadedStateImpl(
      null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as ProductList,
      null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as CategoryList,
    ));
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductListCopyWith<$Res> get products {
    return $ProductListCopyWith<$Res>(_value.products, (value) {
      return _then(_value.copyWith(products: value));
    });
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryListCopyWith<$Res> get categories {
    return $CategoryListCopyWith<$Res>(_value.categories, (value) {
      return _then(_value.copyWith(categories: value));
    });
  }
}

/// @nodoc

class _$LoadedStateImpl implements _LoadedState {
  const _$LoadedStateImpl(this.products, this.categories);

  @override
  final ProductList products;
  @override
  final CategoryList categories;

  @override
  String toString() {
    return 'SearchState.loaded(products: $products, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedStateImpl &&
            (identical(other.products, products) ||
                other.products == products) &&
            (identical(other.categories, categories) ||
                other.categories == categories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products, categories);

  /// Create a copy of SearchState
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
    required TResult Function(ProductList products, CategoryList categories)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(products, categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductList products, CategoryList categories)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(products, categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductList products, CategoryList categories)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(products, categories);
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

abstract class _LoadedState implements SearchState {
  const factory _LoadedState(
          final ProductList products, final CategoryList categories) =
      _$LoadedStateImpl;

  ProductList get products;
  CategoryList get categories;

  /// Create a copy of SearchState
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
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SearchState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SearchState
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
    required TResult Function(ProductList products, CategoryList categories)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(ProductList products, CategoryList categories)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(ProductList products, CategoryList categories)? loaded,
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

abstract class _ErrorState implements SearchState {
  const factory _ErrorState(final String message) = _$ErrorStateImpl;

  String get message;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
