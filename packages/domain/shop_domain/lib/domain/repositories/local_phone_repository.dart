import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

abstract interface class ILocalPhoneRepository{
  Future<Either<DomainError,String?>> find();
  Future<Either<DomainError, void>> save(String phone);
}