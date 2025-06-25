import 'package:shop_domain/error/entity/domain_exception.dart';
import 'package:hive/hive.dart' as hive;

class DomainErrorMapper {
  static DomainError map(Exception exception) {
    if (exception is DomainError) {
      return exception as DomainError;
    }

    if (exception is hive.HiveError) {
      return DomainError.hiveError(
        message: exception.toString(),
      );
    }

    return DomainError.unknown(
      message: exception.toString(),
    );
  }
} 