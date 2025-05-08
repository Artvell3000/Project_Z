import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/data/datasource/hive_config.dart';
import 'package:project_z/data/datasource/user_phone/entity/hive_user_phone/hive_user_phone.dart';

@injectable
class HiveUserPhoneService {
  static const _boxName = 'user_phone_box';
  static const _key = 'user_phone';

  Future<Box<HiveUserPhone>> get _box async {
    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(HiveConfig.userPhoneTypeId)){
      Hive.registerAdapter(HiveUserPhoneAdapter());
    }

    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<HiveUserPhone>(_boxName);
    }
    return Hive.box<HiveUserPhone>(_boxName);
  }

  Future<String?> find() async {
    final box = await _box;
    final phone = box.get(_key);

    return phone?.phone;
  }

  Future<void> save(String phone) async {
    final box = await _box;
    await box.clear();
    await box.put(_key, HiveUserPhone(phone: phone));
  }

  Future<void> clear() async {
    final box = await _box;
    await box.clear();
  }
}