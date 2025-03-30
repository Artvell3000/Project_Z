import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:project_z/core/bloc/search/search_bloc.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/features/search/presentation/bloc/search_filter.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';
part 'search_screen_bloc.freezed.dart';

@injectable
class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  late String error;
  final SearchBloc bloc;
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

  SearchScreenBloc(this.bloc, {this.initFilter}) : super(const SearchScreenState.loading()) {
    on<SearchScreenEvent>((event, emit) {
      event.when(
          loading: (from, to, enabled, status){
            emit(const SearchScreenState.loading());
            if(!isInitialized) return;

            // Logger().i('[enabled] $enabled');
            // Logger().i('[from] $from');
            // Logger().i('[to] $to');
            final result = bloc.searchByCategoryPriceStatus(
                from: from,
                to: to,
                categories: enabled,
                status: initFilter?.status
            );
            // Logger().i('[result] ${result.length}');
            add(SearchScreenEvent.loaded(
                products: result,
                quantity: _calcQuantity(result),
                enabled: enabled ?? [],
                struct: bloc.struct,
                status: status
            )
            );
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
    initListeners();
  }

  Future<void> initListeners() async {
    bloc.stream.listen((state){
      state.mapOrNull(
          loaded: (data){

            if(!isInitialized){
              isInitialized = true;
              if(initFilter!=null){
                add(SearchScreenEvent.loading(
                  to: initFilter?.to,
                  from: initFilter?.from,
                  categories: initFilter?.enabled,
                ));
              }
            }

            add(SearchScreenEvent.loaded(
                products: data.products.results,
                quantity: _calcQuantity(data.products.results),
                enabled: [],
                struct: bloc.struct,
                status: null
            ));
          },
          error: (data){
            add(SearchScreenEvent.error(error: data.message));
          }
      );
    });
  }

}
