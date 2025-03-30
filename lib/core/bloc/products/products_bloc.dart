import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/domain/entity/product/product.dart';
import 'package:project_z/core/network/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_bloc.freezed.dart';
part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiService api;

  ProductsBloc(this.api) : super(const ProductsState.loading()) {
    Logger().i('[ProductsBloc] init');
    on<ProductsEvent>((event, emit) async {
      await event.map(
        load: (_) async => await _loadProducts(emit),
        refresh: (_) async => await _loadProducts(emit),
      );
    });

    add(const ProductsEvent.load());
  }

  Future<void> _loadProducts(Emitter<ProductsState> emit) async {
    try {
      emit(const ProductsState.loading());
      final products = await api.getProducts();
      emit(ProductsState.loaded(products));
    } catch (e) {
      emit(ProductsState.error('Ошибка загрузки товаров: $e'));
    }
  }
}