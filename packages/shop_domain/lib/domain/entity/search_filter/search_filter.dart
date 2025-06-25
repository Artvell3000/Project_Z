import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_domain/domain/entity/category/category.dart';

part 'search_filter.freezed.dart';

@freezed
class SearchFilter with _$SearchFilter {
  const SearchFilter._();

  const factory SearchFilter({
    Category? enabled,
    String? status,
    String? search,
    List<Category>? subcategories,
    double? to,
    double? from,
  }) = _SearchFilter;


  bool get isEmpty =>
      enabled == null &&
          status == null &&
          search == null &&
          subcategories == null &&
          to == null &&
          from == null;

  static SearchFilter get empty =>  const SearchFilter();
}