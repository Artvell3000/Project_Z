import 'package:shop_domain/domain/entity/category/category.dart';
import 'package:shop_network/datasource/entity/category/category.dart';

import 'extract_page_number_function.dart';


extension CategoryMapper on CategoryDTO {
  Category toDomain() {
    return Category(
      id: id,
      mobileImage: mobileImage,
      name: name,
      description: description,
      image: image,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      subcategoryId: subcategory,
    );
  }
}

extension PaginatedCategoryMapper on PaginatedCategoryDTO {
  CategoryPage toDomain() {
    return CategoryPage(
      count: count,
      next: ExtractPageNumberFunction.body(next),
      previous: ExtractPageNumberFunction.body(previous),
      results: results.map((category) => category.toDomain()).toList(),
    );
  }
}