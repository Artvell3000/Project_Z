import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';

@freezed
class NewsPage with _$NewsPage {
  const factory NewsPage({
    required int count,
    int? next,
    int? previous,
    required List<News> results,
  }) = _NewsPage;
}

@freezed
class News with _$News {
  const factory News({
    required int id,
    required String image,
    String? mobileImage,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _News;
}
