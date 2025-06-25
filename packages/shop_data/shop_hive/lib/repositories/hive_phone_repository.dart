import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/repositories/local_phone_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_hive/datasource/user_phone/service/hive_user_phone_service.dart';
import 'package:shop_hive/domain/domain_error_mapper.dart';

@Injectable(as: ILocalPhoneRepository)
class HivePhoneRepository implements ILocalPhoneRepository{
  HivePhoneRepository(this._loader);
  final HiveUserPhoneService _loader;

  @override
  Future<Either<DomainError, String?>> find() async {
    try{
      final phone = await _loader.find();
      return Right(phone);
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

  @override
  Future<Either<DomainError, void>> save(String phone) async {
    try{
      final p = await _loader.save(phone);
      return Right(p);
    } on Exception catch (e) {
      return Left(DomainErrorMapper.map(e));
    }
  }

}