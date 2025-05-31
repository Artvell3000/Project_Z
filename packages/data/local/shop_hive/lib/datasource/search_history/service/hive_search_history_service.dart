import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_hive/datasource/hive_config.dart';
import 'package:shop_hive/datasource/search_history/entity/search_history/search_history.dart';


class HiveSearchHistoryService {
  static const String _boxName = 'searchHistory';
  static const String _key = 'history';

  Future<Box<HiveSearchHistory>> get _box async {
    await Hive.initFlutter();

    if(!Hive.isAdapterRegistered(HiveConfig.searchHistoryTypeId)){
      Hive.registerAdapter(HiveSearchHistoryAdapter());
    }

    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<HiveSearchHistory>(_boxName);
    }
    return Hive.box<HiveSearchHistory>(_boxName);
  }

  Future<HiveSearchHistory> find() async {
    final box = await _box;
    final history = box.get(_key);
    return history ?? HiveSearchHistory(items: []);
  }

  Future<void> save(HiveSearchHistory history) async {
    final box = await _box;

    await box.put(_key, history);
  }

  Future<void> clear() async {
    final box = await _box;
    await box.delete(_key);
  }
}