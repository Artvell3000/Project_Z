import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_domain/domain/repositories/local_lang_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:shop_hive/datasource/lang/service/hive_used_lang_service.dart';
import 'package:shop_hive/domain/domain_error_mapper.dart';

@Injectable(as: ILocalLangRepository)
class HiveLocalLangRepository implements ILocalLangRepository{
  HiveLocalLangRepository(this._loader);
  final HiveLocalLangService _loader;

  @override
  Future<Either<DomainError, String>> find() async {
    try{
      final lang = await _loader.find();
      return Right(lang);
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