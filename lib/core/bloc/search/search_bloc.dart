import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/bloc/categories/categories_bloc.dart';
import 'package:project_z/core/bloc/products/products_bloc.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ProductList? _productList;
  CategoryList? _categoryList;
  final ProductsBloc _productsBloc;
  final CategoriesBloc _categoriesBloc;
  Map<Category,List<Category>>? _struct;

  Map<Category,List<Category>> get struct{
    return _struct ?? {};
  }

  SearchBloc(this._productsBloc, this._categoriesBloc) : super(const SearchState.loading()) {
    Logger().i('[SearchBloc] init');
    on<SearchEvent>((event, emit) {
      event.when(
          loaded: (productList, categoryList){
            emit(SearchState.loaded(productList, categoryList));
          },
          loadedWithError: (error){
            emit(SearchState.error(error));
          },
          searchByStatus: (status){},
          searchByCategoriesAndPrice: (from,to,categories){}
      );
    });
    initListeners();
  }



  Map<Category,List<Category>> _getStruct(List<Category> categories){
    Logger().i('[_getStruct] $categories');
    Map<Category,List<Category>> result = {};
    List<Category> values = [];

    for(final el in categories) {
      if (el.subcategoryId == null) {
        result[el] = [];
      } else {
        values.add(el);
      }
    }

    for(final key in result.keys){
      for(final el in values){
        if(key.id == el.subcategoryId!) result[key]?.add(el);
      }
    }
    _logStruct(result);
    return result;
  }

  void _logStruct(Map<Category,List<Category>> result){
    String str = '\n';
    for(final key in result.keys){
      str+='${key.name}\n';
      for(final value in result[key]!){
        str+='---${value.name}\n';
      }
    }
    Logger().i('[_getStruct] $str');
  }

  Product? searchById(int id){
    if(_productList == null){
      Logger().e('[SearchBloc: productList == null] searchById $id');
      return null;
    }
    for(final el in _productList!.results){
      if(el.id == id) return el;
    }
    return null;
  }

  List<Product> searchByStatus(String status){
    if(_productList == null){
      Logger().e('[SearchBloc: productList == null] $status');
      return [];
    }
    final List<Product> newProducts = [];
    for(final el in _productList!.results){
      if(el.status == status){
        newProducts.add(el);
      }
    }
    return newProducts;
  }

  List<Product> searchByCategoryPriceStatus({double? from, double? to, List<Category>? categories, String? status}){
    if(_productList == null){
      Logger().e('[SearchBloc: productList == null] searchByCategoryAndPrice');
      return [];
    }
    return _productList!.results.where((p){
      bool matchCategory = false, matchFrom = false, matchTo = false, matchStatus = false;

      if(status==null){
        matchStatus = true;
      }else{
        matchStatus = (p.status == status);
      }

      if(from == null){
        matchFrom = true;
      }else{
        matchFrom = (p.finalPrice >= from);
      }

      if(to == null){
        matchTo = true;
      }else{
        matchTo = (p.finalPrice <= to);
      }

      if(categories == null || categories.isEmpty){
        matchCategory = true;
      }else{
        final enabled = List.from(categories);
        final enabledSubcategories = <Category>[];
        for(final c in enabled){
          if(struct[c]?.isNotEmpty ?? false){
            for(final sub in struct[c]!){
              enabledSubcategories.add(sub);
            }
          }
          enabledSubcategories.insertAll(0, enabledSubcategories);
        }
        enabled.insertAll(0, enabledSubcategories);

        matchCategory = enabled.map((e) => e.id).toList().contains(p.subcategory);
        Logger().i('[matchCategory] $matchCategory');
      }

      //_logSearchByCategoryAndPrice(_productList!.results, categories ?? []);
      //Logger().i('[matchCategory && matchFrom && matchTo] $matchCategory && $matchFrom && $matchTo');

      return matchCategory && matchFrom && matchTo  && matchStatus;
    }).toList();
  }

  void _logSearchByCategoryAndPrice(List<Product> p, List<Category> c){
    String str = 'product: ';
    for(final el in p){
      str += '${el.subcategory}, ';
    }
    str += '\ncategories: ';
    for(final el in c){
      str += '${el.id}, ';
    }
    Logger().i('[logSearchByCategoryAndPrice] $str');
  }

  void initListeners(){
    _productsBloc.stream.listen((state){
      state.mapOrNull(
          loaded: (data){
            _productList = data.products;
            if(_categoryList != null) {
              add(SearchEvent.loaded(productList: _productList!, categoryList:  _categoryList!));
            }
          },
          error: (data){
            add(SearchEvent.loadedWithError(error: data.message));
          }
      );
    });
    _categoriesBloc.stream.listen((state){
      state.mapOrNull(
          loaded: (data){
            _categoryList = data.categories;
            _struct = _getStruct(_categoryList!.results);
            if(_productList != null) add(SearchEvent.loaded(productList: _productList!, categoryList:  _categoryList!));
          },
          error: (data){
            add(SearchEvent.loadedWithError(error: data.message));
          }
      );
    });
  }
}
