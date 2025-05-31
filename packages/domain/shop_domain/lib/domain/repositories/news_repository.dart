import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/news/news.dart';

abstract interface class INewsRepository{
  Future<Either<Exception,NewsPage>> get();
}