import 'package:hive_flutter/adapters.dart';

class HiveUserPhoneService {
  static const _boxName = 'user_phone_box';
  static const _key = 'user_phone';

  Future<Box<String>> get _box async {
    await Hive.initFlutter();

    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<String>(_boxName);
    }
    return Hive.box<String>(_boxName);
  }

  Future<String?> find() async {
    final box = await _box;
    final phone = box.get(_key);
    return phone;
  }

  Future<void> save(String phone) async {
    final box = await _box;
    await box.clear();
    await box.put(_key, phone);
  }

  Future<void> clear() async {
    final box = await _box;
    await box.clear();
  }
}