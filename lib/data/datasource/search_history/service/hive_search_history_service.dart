import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:project_z/data/datasource/hive_config.dart';
import 'package:project_z/data/datasource/search_history/entity/search_history/search_history.dart';

@injectable
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

  Future<void> add(String newItem) async {
    final box = await _box;
    HiveSearchHistory? history = box.get(_key);
    List<String> items = history?.items ?? [];

    if (items.length >= 10) {
      items.removeAt(0);
    }
    items.add(newItem);

    await box.put(_key, HiveSearchHistory(items: items));
  }

  Future<void> clear() async {
    final box = await _box;
    await box.delete(_key);
  }
}