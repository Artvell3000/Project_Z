import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';


part 'search_screen_event.dart';

part 'search_screen_state.dart';

part 'search_screen_bloc.freezed.dart';

@injectable
class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  SearchScreenBloc(this._iProductRepository, this._initFilter) : super(const SearchScreenState.loading()) {
    on<SearchScreenEvent>((event, emit) async {
      await event.map(
          init: (d) async => await _onInit(emit),
          loadMore: (d) async => await _onLoadMore(emit),
        refresh: (d) async => await _onRefresh(d.filter, emit)
      );
    });

    add(const SearchScreenEvent.init());
  }

  SearchFilter _initFilter;
  final IProductRepository _iProductRepository;
  final List<Product> _products = [];
  int? _nextPageNum = 1;
  int _count = 0;

  //on event
  Future<void> _onInit(Emitter<SearchScreenState> emit) async {
    await _updateList(emit);
  }

  Future<void> _onLoadMore(Emitter<SearchScreenState> emit) async {
    await _updateList(emit);
  }

  Future<void> _onRefresh(SearchFilter filter,Emitter<SearchScreenState> emit) async {
    emit(const SearchScreenState.loading());
    _nextPageNum = 1;
    _initFilter = filter.copyWith();
    _products.clear();
    await _updateList(emit);
  }

  //methods
  Future<void> _updateList(Emitter<SearchScreenState> emit) async {
    if (_nextPageNum == null) {
      emit(SearchScreenState.loaded(
          products: _products,
          quantity: _count,
          page: -1,
          isAllProducts: true
      ));
      return;
    }

    final response = await _iProductRepository.getByFilter(_initFilter, page: _nextPageNum);
    response.fold((e) {
      emit(SearchScreenState.error(e));
    }, (page) {
      _products.addAll(page.results);
      _count = page.count;

      //Logger().i('[search] ${page.nextPage} : $_nextPageNum');

      emit(SearchScreenState.loaded(
          products: _products,
          quantity: _count,
          page: _nextPageNum!,
          isAllProducts: false
      ));

      _nextPageNum = page.nextPage;
    });
  }
}
