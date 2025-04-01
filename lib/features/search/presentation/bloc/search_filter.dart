import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_z/core/domain/entity/entity.dart';

part 'search_filter.freezed.dart';

@freezed
class SearchFilter with _$SearchFilter {
  const factory SearchFilter({
    Category? enabled,
    String? status
  }) = _SearchFilter;
}