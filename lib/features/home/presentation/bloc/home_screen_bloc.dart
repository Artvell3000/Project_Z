import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/domain/entity/news/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

part 'home_screen_bloc.freezed.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final ApiService api;

  late List<Category> categories;
  late List<News> news;
  late List<Product> newProducts;
  late List<Product> specialOffer;
  late String error;

  late Map<int, List<Category>> _struct;

  HomeScreenBloc(this.api) : super(const HomeScreenState.loading()) {
    Logger().i('[HomeScreenBloc] init');
    on<HomeScreenEvent>((event, emit) async {
      event.map(
          loaded: (d) => _onLoadedData(d, emit),
          error: (data) {
            emit(HomeScreenState.error(productsError: data.error));
          },
          moveTo: (d) => _onMoveTo(d, emit));
    });

    loadData();
  }

  List<Category> getSubcategories(int parentId){
    return _struct[parentId] ?? [];
  }

  void _onLoadedData(_LoadedEvent d, Emitter<HomeScreenState> emit) {
    final mainCategories = d.categories.where((c) => c.subcategoryId == null).toList();
    emit(HomeScreenState.loaded(
      categories: mainCategories,
      news: d.news,
      newProducts: d.newProducts,
      specialOffer: d.specialOffer,
    ));
  }

  void _onMoveTo(_MoveToEvent d, Emitter<HomeScreenState> emit) {
    if (d.toSearchWithCategory) {
      emit(HomeScreenState.moveTo(toSearchWithCategory: d.toSearchWithCategory, parentCategoryId: d.parentCategoryId));
    }
  }

  Future<void> loadData() async {
    try {
      newProducts = (await api.searchProducts(status: newProductStatus)).results;
      specialOffer = (await api.searchProducts(status: specialOfferStatus)).results;



      categories = (await api.getCategories()).results;

      Map<int, List<Category>> struct = {};

      for(final el in categories){
        if(el.subcategoryId == null){
          struct[el.id] = [];
        } else {
          if(struct[el.subcategoryId] == null){
            struct[el.subcategoryId!] = [el];
          } else {
            struct[el.subcategoryId!]!.add(el);
          }
        }
      }
      _struct = struct;

      news = (await api.getNews()).results;
      add(HomeScreenEvent.loaded(
          categories: categories, news: news, newProducts: newProducts, specialOffer: specialOffer));
    } catch (e) {
      add(HomeScreenEvent.error(e.toString()));
    }
  }
}
