part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded(NewsList news) = _Loaded;
  const factory NewsState.error(String message) = _Error;
}