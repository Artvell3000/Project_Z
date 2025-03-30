part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.load() = _LoadNews;
  const factory NewsEvent.refresh() = _RefreshNews;
}