import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_hive/datasource/search_history/entity/search_history/search_history.dart';


class HiveSearchHistoryService {
  static const String _boxName = 'searchHistory';
  static const String _key = 'history'; 

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HiveSearchHistoryItemAdapter()); 
  }

  
  Future<Box<List<dynamic>>> get _box async { 
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<List<dynamic>>(_boxName);
    }
    return Hive.box<List<dynamic>>(_boxName);
  }

  
  Future<List<HiveSearchHistoryItem>> find() async {
    final box = await _box;
    final List<dynamic>? rawHistory = box.get(_key);

    if (rawHistory == null) {
      return [];
    }

    
    return rawHistory.whereType<HiveSearchHistoryItem>().toList();
  }

  
  Future<void> save(List<HiveSearchHistoryItem> history) async {
    final box = await _box;
    await box.put(_key, history); 
  }

 
  Future<void> clear() async {
    final box = await _box;
    await box.delete(_key); 
  }
}