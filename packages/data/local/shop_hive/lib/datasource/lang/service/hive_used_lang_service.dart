import 'package:hive_flutter/hive_flutter.dart';


class HiveLocalLangService {
  static const String _boxName = 'used_lang';
  static const String _key = 'lang';

  Future<Box<String>> get _box async {
    await Hive.initFlutter();

    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<String>(_boxName);
    }
    return Hive.box<String>(_boxName);
  }

  Future<String> find() async {
    final box = await _box;
    final lang = box.get(_key);
    if(lang!=null){
      return lang;
    } else {
      await box.put(_key, 'Uz');
      return 'Uz';
    }
  }

  Future<void> save(String lang) async {
    final box = await _box;
    await box.put(_key, lang);
  }
}