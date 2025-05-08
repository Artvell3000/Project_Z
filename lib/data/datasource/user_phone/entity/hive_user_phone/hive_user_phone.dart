import 'package:hive/hive.dart';
import 'package:project_z/data/datasource/hive_config.dart';

part 'hive_user_phone.g.dart';

@HiveType(typeId: HiveConfig.userPhoneTypeId)
class HiveUserPhone {
  @HiveField(0)
  final String phone;

  HiveUserPhone({
    required this.phone,
  });
}