import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/news/news.dart';
import 'package:shop_domain/domain/repositories/news_repository.dart';
import 'package:shop_network/datasource/mappers/news_mapper.dart';
import 'package:shop_network/datasource/service/api_service.dart';


class ApiNewsRepository implements INewsRepository{
  ApiNewsRepository(this._apiService);
  final ApiService _apiService;

  @override
  Future<Either<Exception,NewsPage>> get() async {
    try{
      final response = await _apiService.getNews();
      return Right(response.toDomain());
    } on Exception catch(e){
      return Left(e);
    }
  }
}