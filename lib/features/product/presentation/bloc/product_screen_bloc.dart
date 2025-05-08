import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/constants/product/status.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/domain/repositories/product_repository.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

part 'product_screen_event.dart';

part 'product_screen_state.dart';

part 'product_screen_bloc.freezed.dart';

@injectable
class ProductScreenBloc extends Bloc<ProductScreenEvent, ProductScreenState> {
  final int id;
  final IProductRepository _iProductRepository;
  late Product product;
  late List<Product> newProducts;

  ProductScreenBloc(@factoryParam this.id, this._iProductRepository,) : super(const ProductScreenState.loading()) {
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
      product = (await _iProductRepository.getById(id)).getOrElse((e) => throw(e));
      newProducts = (await _iProductRepository.getByStatus(newProductStatus)).getOrElse((e) => throw(e)).results;
      add(ProductScreenEvent.productLoaded(product, newProducts));
    } catch(e){
      add(ProductScreenEvent.productError(e.toString()));
    }
  }
}
