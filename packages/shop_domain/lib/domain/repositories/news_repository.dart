import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/news/news.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class INewsRepository{
  Future<Either<DomainError,NewsPage>> getNews();
}