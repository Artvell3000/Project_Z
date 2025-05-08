import 'package:fpdart/src/either.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/core/domain/repositories/local_phone_repository.dart';
import 'package:project_z/data/datasource/user_phone/service/hive_user_phone_service.dart';

@Injectable(as: ILocalPhoneRepository)
class HivePhoneRepository implements ILocalPhoneRepository{
  HivePhoneRepository(this._loader);
  final HiveUserPhoneService _loader;



  @override
  Future<Either<Exception, String?>> find() async {
    try{
      final phone = await _loader.find();
      return Right(phone);
    } on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> save(String phone) async {
    try{
      final p = await _loader.save(phone);
      return Right(p);
    } on HiveError catch (e) {
      return Left(Exception('Hive error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: $e'));
    }
  }

}