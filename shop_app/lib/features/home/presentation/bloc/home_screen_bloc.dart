import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/category/category.dart';
import 'package:shop_domain/domain/entity/news/news.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/repositories/category_repository.dart';
import 'package:shop_domain/domain/repositories/news_repository.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';


part 'home_screen_event.dart';

part 'home_screen_state.dart';

part 'home_screen_bloc.freezed.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this._iCategoryRepository, this._iProductRepository, this._iNewsRepository) : super(const HomeScreenState.loading()) {
    on<HomeScreenEvent>((event, emit) async {
      await event.map(
        init: (d) => _onInit(d, emit),
        refresh: (d) => _onRefresh(d, emit),
      );
    });
    add(const HomeScreenEvent.init());
  }

  final ICategoryRepository _iCategoryRepository;
  final IProductRepository _iProductRepository;
  final INewsRepository _iNewsRepository;

  late Map<Category,List<Category>> _categories;
  late NewsPage _news;
  late ProductPage _newProducts;
  late ProductPage _specialOffer;
  late String error;

  List<Category> getSubcategories(Category category){
    return _categories[category] ?? [category];
  }


  Future<void> _onInit(_InitEvent d, Emitter<HomeScreenState> emit) async {
    await _update(emit);
  }

  Future<void> _onRefresh(_RefreshEvent d, Emitter<HomeScreenState> emit) async {
    await _update(emit);
  }

  Future<void> _update(Emitter<HomeScreenState> emit) async {
    try {
      _newProducts = (await _iProductRepository.getByStatus(newProductStatus)).getOrElse((e)=>throw(e));
      _specialOffer = (await _iProductRepository.getByStatus(specialOfferStatus)).getOrElse((e)=>throw(e));
      _categories = (await _iCategoryRepository.getStructured()).getOrElse((e)=>throw(e));
      _news = (await _iNewsRepository.getNews()).getOrElse((e)=>throw(e));
      emit(HomeScreenState.loaded(
          categories: _categories.keys.toList(),
          news: _news.results,
          newProducts: _newProducts.results,
          specialOffer: _specialOffer.results
      ));
    } on DomainError catch (e) {
      _loadError(e, emit);
    }
  }

  void _loadError(DomainError e,Emitter<HomeScreenState> emit){
    emit(HomeScreenState.error(e));
  }
}
