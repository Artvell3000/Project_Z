// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageImpl _$$ProductImageImplFromJson(Map<String, dynamic> json) =>
    _$ProductImageImpl(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      product: (json['product'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductImageImplToJson(_$ProductImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'product': instance.product,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      description: Map<String, String>.from(json['description'] as Map),
      characteristics: Map<String, String>.from(json['characteristics'] as Map),
      price: json['price'] as String,
      discount: json['discount'] as String,
      quantity: (json['quantity'] as num).toInt(),
      productCode: (json['product_code'] as num).toInt(),
      status: json['status'] as String?,
      slug: json['slug'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      subcategory: (json['subcategory'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'description': instance.description,
      'characteristics': instance.characteristics,
      'price': instance.price,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'product_code': instance.productCode,
      'status': instance.status,
      'slug': instance.slug,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'subcategory': instance.subcategory,
    };

_$ProductListImpl _$$ProductListImplFromJson(Map<String, dynamic> json) =>
    _$ProductListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductListImplToJson(_$ProductListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
