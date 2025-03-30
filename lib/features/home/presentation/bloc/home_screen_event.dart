part of 'home_screen_bloc.dart';

@freezed
class HomeScreenEvent with _$HomeScreenEvent {
  const factory HomeScreenEvent.loaded({
    required List<Category> categories,
    required List<News> news,
    required List<Product> newProducts,
    required List<Product> specialOffer,
  }) = _LoadedEvent;

  const factory HomeScreenEvent.error({
    required String error,
  }) = _ErrorEvent;
}