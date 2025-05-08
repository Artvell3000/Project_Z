import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/product/product.dart';
import 'package:project_z/core/error/entity/domain_exception.dart';
import 'package:project_z/features/search/domain/entity/search_filter.dart';

abstract interface class IProductRepository{
  Future<Either<DomainError, Product>> getById(int id);
  Future<Either<DomainError, ProductPage>> getByPage({int? page});
  Future<Either<DomainError, ProductPage>> getByStatus(String status,{ int? page});
  Future<Either<DomainError, ProductPage>> getByFilter(SearchFilter filter, {int? page});
}