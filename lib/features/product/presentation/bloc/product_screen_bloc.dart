import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/bloc/search/search_bloc.dart';
import 'package:project_z/core/domain/entity/entity.dart';

part 'product_screen_event.dart';

part 'product_screen_state.dart';

part 'product_screen_bloc.freezed.dart';

@injectable
class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  final int id;
  final SearchBloc bloc;

  ProductScreenBloc(this.id, this.bloc) : super(const ProductScreenState.loading()) {
    on<ProductScreenEvent>((event, emit) {
      event.when(
          loading: () {
            emit(const ProductScreenState.loading());
          },
          productLoaded: (product, newProducts) {
            emit(ProductScreenState.loadedProducts(
                product: product, newProducts: newProducts));
          },
          productError: (message) {
            emit(ProductScreenState.errorProducts(productError: message));
          },);
    });
    initListeners();
  }

  Future<void> initListeners() async {
    bloc.stream.listen((state){
      state.mapOrNull(
          loaded: (data){
            final product = bloc.searchById(id);
            if(product == null){
              add(const ProductScreenEvent.productError('NOT FOUND'));
            }
            final newProducts = bloc.searchByStatus(newProductStatus);
            
            add(ProductScreenEvent.productLoaded(product!, newProducts));
          }, 
          error: (data){
            add(ProductScreenEvent.productError(data.message));
          }
      );
    });
  }
}
