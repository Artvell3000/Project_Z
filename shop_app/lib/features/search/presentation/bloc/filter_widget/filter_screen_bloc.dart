import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/category/category.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/domain/repositories/category_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

part 'filter_screen_event.dart';
part 'filter_screen_state.dart';
part 'filter_screen_bloc.freezed.dart';

@injectable
class FilterScreenBloc extends Bloc<FilterScreenEvent, FilterScreenState> {
  FilterScreenBloc(this._iCategoryRepository, this._initFilter) : super(const FilterScreenState.loading()) {
    _filter = _initFilter.copyWith();
    on<FilterScreenEvent>((event, emit) async {
      await event.map(
          init: (d) async => await _onInit(emit),
          loadingSubcategories: (d) async => await _onLoadingSubcategories(d.parent, emit),
          loadingMainCategories: (d) async => await _onLoadingMainCategories(emit)
      );
    });

    add(const FilterScreenEvent.init());
  }

  final ICategoryRepository _iCategoryRepository;
  final SearchFilter _initFilter;
  late SearchFilter _filter;
  late final Map<Category, List<Category>> _struct;

  //setters && getters
  set enabled(Category? c) => _filter = _filter.copyWith(enabled: c);
  set to(double? to) => _filter = _filter.copyWith(to: to);
  set from(double? from) => _filter = _filter.copyWith(from: from);
  SearchFilter get filter => _filter.copyWith();
  Category? get enabled => _filter.enabled;

  //on event
  Future<void> _onLoadingMainCategories(Emitter<FilterScreenState> emit) async {
    emit(
      FilterScreenState.showingMainCategories(_struct.keys.toList())
    );
  }

  Future<void> _onLoadingSubcategories(Category parent ,Emitter<FilterScreenState> emit) async {
    emit(
      FilterScreenState.showingSubCategories(parent, _struct[parent] ?? [])
    );
  }

  Future<void> _onInit(Emitter<FilterScreenState> emit) async {
    final struct = await _iCategoryRepository.getStructured();
    struct.fold((e){
      emit(FilterScreenState.error(e));
    }, (struct){
      _struct = struct;
      emit(FilterScreenState.loaded(
          categories: _struct.keys.toList(),
          to: _filter.to,
          from: _filter.from
      ));
    });
  }
}
