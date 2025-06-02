import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/entity.dart';
import 'package:shop_domain/domain/repositories/search_history_repository.dart';
import 'package:shop_domain/domain/use_case/search_product_use_case.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';
part 'app_bar_bloc.freezed.dart';

@injectable
class SearchAppBarBloc extends Bloc<SearchAppBarEvent, SearchAppBarState> {
  SearchAppBarBloc(this._searchProduct, this._iSearchHistoryRepository) : super(const SearchAppBarState.base()) {
    on<SearchAppBarEvent>((event, emit) async {
      await event.map(
          init: (d) async => await _onInit(),
          startSearch: (d) async => await _onStartSearch(),
          updateSearchResult: (d) async => await _onUpdateSearchResult(),
          hideSearch: (d) async => await _onEndSearch(),
          clearHistory: (d) async => await _clearHistory()
      );
    });
  }

  final SearchProductUseCase _searchProduct;
  final ISearchHistoryRepository _iSearchHistoryRepository;

  

  Future<void> _onInit() async {
    //_history = (await _iSearchHistoryRepository.get()).getOrElse((e)=> const SearchHistory(items: []));
  }
  Future<void> _onStartSearch() async {}
  Future<void> _onUpdateSearchResult() async {}
  Future<void> _onEndSearch() async {}
  Future<void> _clearHistory() async {}
}
