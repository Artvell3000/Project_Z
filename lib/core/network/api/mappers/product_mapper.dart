import 'package:project_z/core/domain/entity/product/product.dart';
import 'package:project_z/core/network/api/entity/product/product.dart';

import 'extract_page_number_function.dart';

extension ProductMapper on ProductDTO {
  Product toDomain() {
    return Product(
      id: id,
      images: getMobileImages(),
      name: name,
      description: description,
      characteristics: characteristics,
      price: double.tryParse(price) ?? 0.0,
      discount: double.tryParse(discount) ?? 0.0,
      quantity: quantity,
      productCode: productCode,
      status: status,
      slug: slug,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      subcategory: subcategory,
    );
  }

  List<String> getMobileImages() {
    final json = toJson();
    final images = <String>[];
    for(int i=1;i<=5;i++){
      if(json['mobile_image$i'] != null){
        images.add(json['mobile_image$i']);
      }
    }
    if(images.isNotEmpty) return images;
    for(int i=1;i<=5;i++){
      if(json['image$i'] != null){
        images.add(json['image$i']);
      }
    }
    if(images.isNotEmpty) return images;
    return ['Null'];
  }
}

extension PaginatedProductMapper on PaginatedProductDTO {
  ProductPage toDomain() {
    return ProductPage(
      count: count,
      nextPage: ExtractPageNumberFunction.body(next),
      prevPage: ExtractPageNumberFunction.body(previous),
      results: results.map((product) => product.toDomain()).toList(),
    );
  }
}