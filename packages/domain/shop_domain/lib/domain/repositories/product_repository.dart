import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class IProductRepository{
  Future<Either<DomainError, Product>> getById(int id);
  Future<Either<DomainError, ProductPage>> getByPage({int? page});
  Future<Either<DomainError, ProductPage>> getByStatus(String status,{ int? page});
  Future<Either<DomainError, ProductPage>> getByFilter(SearchFilter filter, {int? page});
}