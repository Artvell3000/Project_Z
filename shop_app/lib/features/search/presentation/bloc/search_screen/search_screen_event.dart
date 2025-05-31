part of 'search_screen_bloc.dart';

@freezed
class SearchScreenEvent with _$SearchScreenEvent {
  const factory SearchScreenEvent.init() = _LoadSearch;
  const factory SearchScreenEvent.loadMore() = _LoadMoreSearch;
  const factory SearchScreenEvent.refresh(SearchFilter filter) = _RefreshEvent;
}
