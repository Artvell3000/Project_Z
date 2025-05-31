import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:shop_domain/domain/entity/category/category.dart';
import 'package:shop_domain/domain/repositories/category_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/datasource/mappers/category_mapper.dart';
import 'package:shop_network/datasource/mappers/error_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';


class ApiCategoryRepository implements ICategoryRepository{
  ApiCategoryRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<DomainError, Map<Category, List<Category>>>> getStructured() async {
    try{
      final categories = (await getAll()).getOrElse((e) => throw(e));

      Map<Category, List<Category>> struct = {};

      for(int i=0;i<categories.length;i++){
        if(categories[i].subcategoryId == null){
          struct[categories[i]] = [];
          categories.removeAt(i);
          i--;
        }
      }

      for(final key in struct.keys){
        struct[key] = categories.where((category){
          return category.subcategoryId == key.id;
        }).toList();
      }

      return Right(struct);
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, List<Category>>> getWithLimit(int limit) async {
    try{
      int? next;
      final result = <Category>[];
      int count = 0;
      do{
        final page = (await _apiService.getCategories(page: next)).toDomain();
        next = page.next;
        count += page.count;
        result.insertAll(0, page.results);
      }while(next!=null && count < limit);

      return Right(result);
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, List<Category>>> getAll() async {
    try{
      int? next;
      final result = <Category>[];
      do{
        final page = (await _apiService.getCategories(page: next)).toDomain();
        next = page.next;
        result.insertAll(0, page.results);
      }while(next!=null);

      return Right(result);
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, CategoryPage>> getByPage(int page) async {
    try{
      final response = (await _apiService.getCategories(page: page)).toDomain();
      return Right(response);
    } on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, Category>> getById(int id) async {
    try{
      final categoryDTO = await _apiService.getCategoryById(id);
      return Right(categoryDTO.toDomain());
    }  on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }

  @override
  Future<Either<DomainError, List<Category>>> getSubcategories(int parentId, {int? page}) async {
    try{
      final categoriesDTO = await _apiService.getSubcategoriesByParentId(parentId, page: page);
      return Right(categoriesDTO.results.map((el) => el.toDomain()).toList());
    }  on DioException catch (e){
      return Left(DomainErrorMapper.mapDio(e));
    }
    on Exception catch (e){
      return Left(DomainErrorMapper.mapUnknown(e));
    }
  }
}