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
  SearchAppBarBloc(this._searchProduct, this._iSearchHistoryRepository) : super(const SearchAppBarState.searching()) {
    on<SearchAppBarEvent>((event, emit) async {
      await event.map(
          updateQuery: (d) async => await _updateQuery(d,emit),
          clearHistory: (d) async => await _clearHistory(emit)
      );
    });
  }

  final SearchProductUseCase _searchProduct;
  final ISearchHistoryRepository _iSearchHistoryRepository;

  String _query = "";



  Future<void> _clearHistory(Emitter<SearchAppBarState> emit) async {

  }

  Future<void> _updateQuery(_UpdateQueryAppBarEvent d, Emitter<SearchAppBarState> emit) async {
    if(_query.isNotEmpty){
      final result = await _searchProduct(SearchFilter(search: _query));
      result.fold((e){

      }, (page){
        // emit(SearchAppBarState.result(
        //   names, 
        //   ids, 
        //   false
        //   ));
      });
    }
  }
}
