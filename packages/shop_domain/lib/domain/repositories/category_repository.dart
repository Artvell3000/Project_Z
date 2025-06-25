import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/category/category.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class ICategoryRepository{
  Future<Either<DomainError,List<Category>>> getWithLimit(int limit);
  Future<Either<DomainError,CategoryPage>> getByPage(int page);
  Future<Either<DomainError,List<Category>>> getAll();
  Future<Either<DomainError,Map<Category, List<Category>>>> getStructured();

  Future<Either<DomainError,List<Category>>> getSubcategories(int parentId, {int? page});
  Future<Either<DomainError,Category>> getById(int id);
}