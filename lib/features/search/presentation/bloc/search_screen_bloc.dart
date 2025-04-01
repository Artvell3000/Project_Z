import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/network/api/service/api_service.dart';
import 'package:project_z/features/search/presentation/bloc/search_filter.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';
part 'search_screen_bloc.freezed.dart';

@injectable
class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  late ApiService api;
  late Map<Category,List<Category>> struct;
  bool isInitialized = false;
  SearchFilter? initFilter;


  int _calcQuantity(List<Product> p){
    Logger().i('[calcQuantity] ${p.length}');
    int q = 0;
    for(final el in p){
      q = q + el.quantity;
    }
    return q;
  }

  Map<Category,List<Category>> _getStruct(List<Category> list){
    if(isInitialized) return struct;
    final result = <Category,List<Category>>{};
    final subcategories = <Category>[];
    final idCategory = <int,Category>{};
    for(final el in list){
      if(el.subcategoryId == null){
        result[el] = [];
        idCategory[el.id] = el;
      }else{
        subcategories.add(el);
      }
    }

    for(final el in subcategories){
      try{
        result[idCategory[el.subcategoryId!]!]!.add(el);
      }catch(e){
        Logger().e('[_getStruct] $e');
      }
    }
    struct = result;
    return result;
  }

  SearchScreenBloc(this.api, {this.initFilter}) : super(const SearchScreenState.loading()) {
    on<SearchScreenEvent>((event, emit) {
      event.when(
          loading: (from, to, enabled, status) async {
            emit(const SearchScreenState.loading());
            if(!isInitialized) return;
            try{
              final response = await api.searchProducts(
                  maxPrice: to?.toString(),
                  minPrice: from?.toString(),
                  subcategory: enabled?.id.toString(),
                  status: status
              );

              add(SearchScreenEvent.loaded(
                  products: response.results,
                  quantity: _calcQuantity(response.results),
                  enabled: enabled,
                  struct: struct,
                  status: status
              )
              );
            } catch(e){
              add(SearchScreenEvent.error(e.toString()));
            }
          },
          loaded: (result, quantity, enabled, struct, status){
            emit(SearchScreenState.loaded(
                products: result,
                quantity: quantity,
                enabled: enabled,
                struct: struct,
                status: status
            ));
          },
          error: (message){
            emit(SearchScreenState.error(error: message));
          }
      );
    });
    initData();
  }

  Future<void> initData() async {
    try{
      final categories = await api.getCategories();
      struct = _getStruct(categories.results);

      final products = (await api.searchProducts(
        status: initFilter?.status,
        subcategory: initFilter?.enabled?.name,
      )).results;
      isInitialized = true;
      add(SearchScreenEvent.loaded(
          products: products, 
          quantity: _calcQuantity(products), 
          struct: struct, 
          status: null));
    }catch(e){
      add(SearchScreenEvent.error(e.toString()));
    }
  }

}
