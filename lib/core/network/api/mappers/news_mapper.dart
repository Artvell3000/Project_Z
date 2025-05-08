import 'package:project_z/core/domain/entity/news/news.dart';
import 'package:project_z/core/network/api/entity/news/news.dart';

import 'extract_page_number_function.dart';


extension NewsMapper on NewsDTO {
  News toDomain() {
    return News(
      id: id,
      image: image,
      mobileImage: mobileImage,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
    );
  }
}

extension PaginatedNewsMapper on PaginatedNewsDTO {
  NewsPage toDomain() {
    return NewsPage(
      count: count,
      next: ExtractPageNumberFunction.body(next),
      previous: ExtractPageNumberFunction.body(previous),
      results: results.map((news) => news.toDomain()).toList(),
    );
  }
}