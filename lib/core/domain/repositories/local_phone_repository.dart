import 'package:fpdart/fpdart.dart';

abstract interface class ILocalPhoneRepository{
  Future<Either<Exception,String?>> find();
  Future<Either<Exception, void>> save(String phone);
}