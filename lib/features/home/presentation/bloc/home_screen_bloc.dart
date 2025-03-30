import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/bloc/news/news_bloc.dart';
import 'package:project_z/core/bloc/search/search_bloc.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/domain/entity/news/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

part 'home_screen_bloc.freezed.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final SearchBloc searchBloc;
  final NewsBloc newsBloc;

  List<Category>? categories;
  List<News>? news;
  List<Product>? newProducts;
  List<Product>? specialOffer;
  String? error;

  HomeScreenBloc(this.searchBloc, this.newsBloc)
      : super(const HomeScreenState.loading()) {
    Logger().i('[HomeScreenBloc] init');
    on<HomeScreenEvent>((event, emit) async {
      event.map(
          loaded: (data) {
            emit(HomeScreenState.loaded(
                categories: data.categories,
                news: data.news,
                newProducts: data.newProducts,
                specialOffer: data.specialOffer,
            ));
          },
          error: (data) {
            emit(HomeScreenState.error(productsError: data.error));
          });
    });

    initListeners();
  }

  void initListeners() {
    newsBloc.stream.listen((state) {
      state.mapOrNull(loaded: (data) {
        if (error != null) {
          Logger().i('[HomeScreenBloc : error] ${error!}');
          return;
        }
        news = data.news.results;
        if (categories != null) {
          add(HomeScreenEvent.loaded(
              categories: categories!.where((e) => e.subcategoryId==null).toList(),
              news: news!,
              newProducts: newProducts!,
              specialOffer: specialOffer!));
        }
      }, error: (data) {
        error = data.message;
        if (error != null){
          Logger().i('[HomeScreenBloc : error] ${error!}');
        }
        add(HomeScreenEvent.error(error: error!));
      });
    });
    searchBloc.stream.listen((state) {
      state.mapOrNull(loaded: (data) {
        if (error != null){
          Logger().i('[HomeScreenBloc : error] ${error!}');
          return;
        }
        categories = data.categories.results;
        //Logger().i('[data.products]${data.products}');
        newProducts = searchBloc.searchByStatus(newProductStatus);
        //Logger().i('[newProducts]${newProducts}');
        specialOffer = searchBloc.searchByStatus(specialOfferStatus);
        //Logger().i('[specialOffer]${specialOffer}');
        if (news != null) {
          add(HomeScreenEvent.loaded(
              categories: categories!.where((e) => e.subcategoryId==null).toList(),
              news: news!,
              newProducts: newProducts!,
              specialOffer: specialOffer!));
        }
      }, error: (data) {
        error = data.message;
        if (error != null){
          Logger().i('[HomeScreenBloc : error] ${error!}');
        }
        add(HomeScreenEvent.error(error: error!));
      });
    });
  }
}
