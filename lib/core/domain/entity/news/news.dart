import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.freezed.dart';

part 'news.g.dart';

@freezed
class NewsList with _$NewsList {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NewsList({
    required int count,
    String? next,
    String? previous,
    required List<News> results,
  }) = _NewsList;

  factory NewsList.fromJson(Map<String, dynamic> json) => _$NewsListFromJson(json);
}

@freezed
class News with _$News {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory News({
    required int id,
    required String image,
    @JsonKey(
      name: 'mobile_image',
    )
    String? mobileImage,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
