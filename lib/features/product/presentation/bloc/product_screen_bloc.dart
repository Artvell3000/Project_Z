import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

part 'product_screen_event.dart';

part 'product_screen_state.dart';

part 'product_screen_bloc.freezed.dart';

@injectable
class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  final int id;
  final ApiService api;
  late Product product;
  late List<Product> newProducts;

  ProductScreenBloc(this.id, this.api) : super(const ProductScreenState.loading()) {
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
    loadData();
  }

  Future<void> loadData() async {
    try{
      product = (await api.searchProducts()).results.first;
      newProducts = (await api.searchProducts(status: newProductStatus)).results;
      add(ProductScreenEvent.productLoaded(product, newProducts));
    } catch(e){
      add(ProductScreenEvent.productError(e.toString()));
    }
  }
}
