import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/entity/news/news.dart';
import 'package:shop_domain/domain/repositories/news_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_network/network/mappers/error_mapper.dart';
import 'package:shop_network/network/mappers/news_mapper.dart';
import 'package:shop_network/network/service/catalog_api_service/catalog_api_service.dart';

@Injectable(as: INewsRepository)
class ApiNewsRepository implements INewsRepository{
  ApiNewsRepository(this._apiService);
  final CatalogApiService _apiService;

  @override
  Future<Either<DomainError,NewsPage>> getNews() async {
    try{
      final response = await _apiService.getNews();
      return Right(response.toDomain());
    } on Exception catch(e){
      return Left(DomainErrorMapper.map(e));
    }
  }
}