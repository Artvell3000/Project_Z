import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/domain/repositories/search_history_repository.dart';

part 'app_bar_event.dart';
part 'app_bar_state.dart';
part 'app_bar_bloc.freezed.dart';

@injectable
class AppBarBloc extends Bloc<AppBarEvent, AppBarState> {
  final IProductRepository _iProductRepository;
  final ISearchHistoryRepository _iSearchHistoryRepository;

  AppBarBloc(this._iProductRepository, this._iSearchHistoryRepository) : super(const AppBarState.base()) {
    on<AppBarEvent>((event, emit) async {
      await event.map(
          init: (d) async => await _onInit(),
          startSearch: (d) async => await _onStartSearch(),
          updateSearchResult: (d) async => await _onUpdateSearchResult(),
          hideSearch: (d) async => await _onEndSearch(),
          clearHistory: (d) async => await _clearHistory()
      );
    });
  }

  Future<void> _onInit() async {

  }
  Future<void> _onStartSearch() async {}
  Future<void> _onUpdateSearchResult() async {}
  Future<void> _onEndSearch() async {}
  Future<void> _clearHistory() async {}
}
