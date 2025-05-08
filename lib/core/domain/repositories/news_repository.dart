import 'package:fpdart/fpdart.dart';
import 'package:project_z/core/domain/entity/entity.dart';

abstract interface class INewsRepository{
  Future<Either<Exception,NewsPage>> get();
}