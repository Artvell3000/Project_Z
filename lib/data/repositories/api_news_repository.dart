import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/entity/news/news.dart';
import 'package:project_z/core/domain/repositories/news_repository.dart';
import 'package:project_z/core/network/api/mappers/news_mapper.dart';
import 'package:project_z/core/network/api/service/api_service.dart';

@Injectable(as: INewsRepository)
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