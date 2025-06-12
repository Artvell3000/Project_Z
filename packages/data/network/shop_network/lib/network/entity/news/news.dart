import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class PaginatedNewsDTO with _$PaginatedNewsDTO {
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
  const factory NewsDTO({
    required int id,
    required String image,
    String? mobileImage,
    required String createdAt,
    required String updatedAt,
  }) = _NewsDTO;

  factory NewsDTO.fromJson(Map<String, dynamic> json) => _$NewsDTOFromJson(json);
}