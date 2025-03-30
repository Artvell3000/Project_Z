// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadedEvent value) loaded,
    required TResult Function(_ErrorEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedEvent value)? loaded,
    TResult? Function(_ErrorEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedEvent value)? loaded,
    TResult Function(_ErrorEvent value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenEventCopyWith<$Res> {
  factory $HomeScreenEventCopyWith(
          HomeScreenEvent value, $Res Function(HomeScreenEvent) then) =
      _$HomeScreenEventCopyWithImpl<$Res, HomeScreenEvent>;
}

/// @nodoc
class _$HomeScreenEventCopyWithImpl<$Res, $Val extends HomeScreenEvent>
    implements $HomeScreenEventCopyWith<$Res> {
  _$HomeScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadedEventImplCopyWith<$Res> {
  factory _$$LoadedEventImplCopyWith(
          _$LoadedEventImpl value, $Res Function(_$LoadedEventImpl) then) =
      __$$LoadedEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Category> categories,
      List<News> news,
      List<Product> newProducts,
      List<Product> specialOffer});
}

/// @nodoc
class __$$LoadedEventImplCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res, _$LoadedEventImpl>
    implements _$$LoadedEventImplCopyWith<$Res> {
  __$$LoadedEventImplCopyWithImpl(
      _$LoadedEventImpl _value, $Res Function(_$LoadedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? news = null,
    Object? newProducts = null,
    Object? specialOffer = null,
  }) {
    return _then(_$LoadedEventImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      newProducts: null == newProducts
          ? _value._newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      specialOffer: null == specialOffer
          ? _value._specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$LoadedEventImpl implements _LoadedEvent {
  const _$LoadedEventImpl(
      {required final List<Category> categories,
      required final List<News> news,
      required final List<Product> newProducts,
      required final List<Product> specialOffer})
      : _categories = categories,
        _news = news,
        _newProducts = newProducts,
        _specialOffer = specialOffer;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<News> _news;
  @override
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  final List<Product> _newProducts;
  @override
  List<Product> get newProducts {
    if (_newProducts is EqualUnmodifiableListView) return _newProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newProducts);
  }

  final List<Product> _specialOffer;
  @override
  List<Product> get specialOffer {
    if (_specialOffer is EqualUnmodifiableListView) return _specialOffer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialOffer);
  }

  @override
  String toString() {
    return 'HomeScreenEvent.loaded(categories: $categories, news: $news, newProducts: $newProducts, specialOffer: $specialOffer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedEventImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality()
                .equals(other._newProducts, _newProducts) &&
            const DeepCollectionEquality()
                .equals(other._specialOffer, _specialOffer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_newProducts),
      const DeepCollectionEquality().hash(_specialOffer));

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedEventImplCopyWith<_$LoadedEventImpl> get copyWith =>
      __$$LoadedEventImplCopyWithImpl<_$LoadedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(categories, news, newProducts, specialOffer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(categories, news, newProducts, specialOffer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories, news, newProducts, specialOffer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadedEvent value) loaded,
    required TResult Function(_ErrorEvent value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedEvent value)? loaded,
    TResult? Function(_ErrorEvent value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedEvent value)? loaded,
    TResult Function(_ErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedEvent implements HomeScreenEvent {
  const factory _LoadedEvent(
      {required final List<Category> categories,
      required final List<News> news,
      required final List<Product> newProducts,
      required final List<Product> specialOffer}) = _$LoadedEventImpl;

  List<Category> get categories;
  List<News> get news;
  List<Product> get newProducts;
  List<Product> get specialOffer;

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedEventImplCopyWith<_$LoadedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorEventImplCopyWith<$Res> {
  factory _$$ErrorEventImplCopyWith(
          _$ErrorEventImpl value, $Res Function(_$ErrorEventImpl) then) =
      __$$ErrorEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorEventImplCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res, _$ErrorEventImpl>
    implements _$$ErrorEventImplCopyWith<$Res> {
  __$$ErrorEventImplCopyWithImpl(
      _$ErrorEventImpl _value, $Res Function(_$ErrorEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorEventImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorEventImpl implements _ErrorEvent {
  const _$ErrorEventImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'HomeScreenEvent.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorEventImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorEventImplCopyWith<_$ErrorEventImpl> get copyWith =>
      __$$ErrorEventImplCopyWithImpl<_$ErrorEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
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
    required TResult Function(_LoadedEvent value) loaded,
    required TResult Function(_ErrorEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadedEvent value)? loaded,
    TResult? Function(_ErrorEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadedEvent value)? loaded,
    TResult Function(_ErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorEvent implements HomeScreenEvent {
  const factory _ErrorEvent({required final String error}) = _$ErrorEventImpl;

  String get error;

  /// Create a copy of HomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorEventImplCopyWith<_$ErrorEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String productsError) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String productsError)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult Function(String productsError)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedDataState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedDataState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedDataState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res, HomeScreenState>;
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res, $Val extends HomeScreenState>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeScreenState
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
    extends _$HomeScreenStateCopyWithImpl<$Res, _$LoadingStateImpl>
    implements _$$LoadingStateImplCopyWith<$Res> {
  __$$LoadingStateImplCopyWithImpl(
      _$LoadingStateImpl _value, $Res Function(_$LoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingStateImpl implements _LoadingState {
  const _$LoadingStateImpl();

  @override
  String toString() {
    return 'HomeScreenState.loading()';
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
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String productsError) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String productsError)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult Function(String productsError)? error,
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
    required TResult Function(_LoadedDataState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedDataState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedDataState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState implements HomeScreenState {
  const factory _LoadingState() = _$LoadingStateImpl;
}

/// @nodoc
abstract class _$$LoadedDataStateImplCopyWith<$Res> {
  factory _$$LoadedDataStateImplCopyWith(_$LoadedDataStateImpl value,
          $Res Function(_$LoadedDataStateImpl) then) =
      __$$LoadedDataStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Category> categories,
      List<News> news,
      List<Product> newProducts,
      List<Product> specialOffer});
}

/// @nodoc
class __$$LoadedDataStateImplCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res, _$LoadedDataStateImpl>
    implements _$$LoadedDataStateImplCopyWith<$Res> {
  __$$LoadedDataStateImplCopyWithImpl(
      _$LoadedDataStateImpl _value, $Res Function(_$LoadedDataStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? news = null,
    Object? newProducts = null,
    Object? specialOffer = null,
  }) {
    return _then(_$LoadedDataStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<News>,
      newProducts: null == newProducts
          ? _value._newProducts
          : newProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      specialOffer: null == specialOffer
          ? _value._specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$LoadedDataStateImpl implements _LoadedDataState {
  const _$LoadedDataStateImpl(
      {required final List<Category> categories,
      required final List<News> news,
      required final List<Product> newProducts,
      required final List<Product> specialOffer})
      : _categories = categories,
        _news = news,
        _newProducts = newProducts,
        _specialOffer = specialOffer;

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<News> _news;
  @override
  List<News> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  final List<Product> _newProducts;
  @override
  List<Product> get newProducts {
    if (_newProducts is EqualUnmodifiableListView) return _newProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newProducts);
  }

  final List<Product> _specialOffer;
  @override
  List<Product> get specialOffer {
    if (_specialOffer is EqualUnmodifiableListView) return _specialOffer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialOffer);
  }

  @override
  String toString() {
    return 'HomeScreenState.loaded(categories: $categories, news: $news, newProducts: $newProducts, specialOffer: $specialOffer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedDataStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            const DeepCollectionEquality()
                .equals(other._newProducts, _newProducts) &&
            const DeepCollectionEquality()
                .equals(other._specialOffer, _specialOffer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_news),
      const DeepCollectionEquality().hash(_newProducts),
      const DeepCollectionEquality().hash(_specialOffer));

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedDataStateImplCopyWith<_$LoadedDataStateImpl> get copyWith =>
      __$$LoadedDataStateImplCopyWithImpl<_$LoadedDataStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String productsError) error,
  }) {
    return loaded(categories, news, newProducts, specialOffer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String productsError)? error,
  }) {
    return loaded?.call(categories, news, newProducts, specialOffer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult Function(String productsError)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories, news, newProducts, specialOffer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedDataState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedDataState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedDataState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedDataState implements HomeScreenState {
  const factory _LoadedDataState(
      {required final List<Category> categories,
      required final List<News> news,
      required final List<Product> newProducts,
      required final List<Product> specialOffer}) = _$LoadedDataStateImpl;

  List<Category> get categories;
  List<News> get news;
  List<Product> get newProducts;
  List<Product> get specialOffer;

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedDataStateImplCopyWith<_$LoadedDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productsError});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productsError = null,
  }) {
    return _then(_$ErrorStateImpl(
      productsError: null == productsError
          ? _value.productsError
          : productsError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl({required this.productsError});

  @override
  final String productsError;

  @override
  String toString() {
    return 'HomeScreenState.error(productsError: $productsError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.productsError, productsError) ||
                other.productsError == productsError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productsError);

  /// Create a copy of HomeScreenState
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
    required TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)
        loaded,
    required TResult Function(String productsError) error,
  }) {
    return error(productsError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult? Function(String productsError)? error,
  }) {
    return error?.call(productsError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Category> categories, List<News> news,
            List<Product> newProducts, List<Product> specialOffer)?
        loaded,
    TResult Function(String productsError)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(productsError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_LoadedDataState value) loaded,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_LoadedDataState value)? loaded,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingState value)? loading,
    TResult Function(_LoadedDataState value)? loaded,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements HomeScreenState {
  const factory _ErrorState({required final String productsError}) =
      _$ErrorStateImpl;

  String get productsError;

  /// Create a copy of HomeScreenState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
