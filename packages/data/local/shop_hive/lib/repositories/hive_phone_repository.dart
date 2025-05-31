import 'package:fpdart/src/either.dart';
import 'package:hive/hive.dart' as hive;
import 'package:shop_domain/domain/repositories/local_phone_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_hive/datasource/user_phone/service/hive_user_phone_service.dart';

class HivePhoneRepository implements ILocalPhoneRepository{
  HivePhoneRepository(this._loader);
  final HiveUserPhoneService _loader;

  @override
  Future<Either<DomainError, String?>> find() async {
    try{
      final phone = await _loader.find();
      return Right(phone);
    } on hive.HiveError catch (e) {
      return Left(DomainError.hiveError(message: e.toString()));
    } catch (e) {
      return Left(DomainError.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<DomainError, void>> save(String phone) async {
    try{
      final p = await _loader.save(phone);
      return Right(p);
    } on hive.HiveError catch (e) {
      return Left(DomainError.hiveError(message: e.toString()));
    } catch (e) {
      return Left(DomainError.unknown(message: e.toString()));
    }
  }

}