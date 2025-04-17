import 'package:hive/hive.dart';

class SearchHistoryService {
  static const String _boxName = 'searchHistory';

  // Добавить запрос в историю
  static Future<void> addSearchQuery(String query) async {
    final box = Hive.box<String>(_boxName);

    // Удаляем дубликаты (если нужно)
    final existingIndex = box.values.toList().indexOf(query);
    if (existingIndex != -1) {
      await box.deleteAt(existingIndex);
    }

    await box.add(query); // Добавляем в конец

    // Ограничиваем историю (например, последние 10 запросов)
    if (box.length > 10) {
      await box.deleteAt(0); // Удаляем самый старый
    }
  }

  // Получить список истории
  static List<String> getSearchHistory() {
    final box = Hive.box<String>(_boxName);
    return box.values.toList().reversed.toList(); // Новые сверху
  }

  // Очистить историю
  static Future<void> clearHistory() async {
    final box = Hive.box<String>(_boxName);
    await box.clear();
  }
}