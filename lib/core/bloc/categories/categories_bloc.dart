import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_z/core/domain/entity/category/category.dart';
import 'package:project_z/core/network/api/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_bloc.freezed.dart';
part 'categories_event.dart';
part 'categories_state.dart';

@injectable
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final ApiService api;

  CategoriesBloc(this.api) : super(const CategoriesState.loading()) {
    Logger().i('[CategoriesBloc] init');
    on<CategoriesEvent>((event, emit) async {
      await event.map(
        load: (_) async => await _loadCategories(emit),
        refresh: (_) async => await _loadCategories(emit),
      );
    });

    add(const CategoriesEvent.load());
  }

  Future<void> _loadCategories(Emitter<CategoriesState> emit) async {
    try {
      emit(const CategoriesState.loading());
      final categories = await api.getCategories();
      emit(CategoriesState.loaded(categories));
    } catch (e) {
      emit(CategoriesState.error('Ошибка загрузки категорий: $e'));
    }
  }
}