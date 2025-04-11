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

  HomeScreenBloc(this.api) : super(const HomeScreenState.loading()) {
    Logger().i('[HomeScreenBloc] init');
    on<HomeScreenEvent>((event, emit) async {
      event.map(loaded: (data) {
        final mainCategories = data.categories.where((c) => c.subcategoryId == null).toList();
        emit(HomeScreenState.loaded(
          categories: mainCategories,
          news: data.news,
          newProducts: data.newProducts,
          specialOffer: data.specialOffer,
        ));
      }, error: (data) {
        emit(HomeScreenState.error(productsError: data.error));
      });
    });

    loadData();
  }

  Future<void> loadData() async {
    try {
      newProducts = (await api.searchProducts(status: newProductStatus)).results;
      specialOffer = (await api.searchProducts(status: specialOfferStatus)).results;
      categories = (await api.getCategories()).results;
      news = (await api.getNews()).results;
      add(HomeScreenEvent.loaded(
          categories: categories, news: news, newProducts: newProducts, specialOffer: specialOffer));
    } catch (e) {
      add(HomeScreenEvent.error(e.toString()));
    }
  }
}
