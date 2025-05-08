import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.freezed.dart';

part 'news.g.dart';

@freezed
class PaginatedNewsDTO with _$PaginatedNewsDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PaginatedNewsDTO({
    required int count,
    String? next,
    String? previous,
    required List<NewsDTO> results,
  }) = _PaginatedNewsDTO;

  factory PaginatedNewsDTO.fromJson(Map<String, dynamic> json) => _$PaginatedNewsDTOFromJson(json);
}

@freezed
class NewsDTO with _$NewsDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NewsDTO({
    required int id,
    required String image,
    String? mobileImage,
    required String createdAt,
    required String updatedAt,
  }) = _NewsDTO;

  factory NewsDTO.fromJson(Map<String, dynamic> json) => _$NewsDTOFromJson(json);
}