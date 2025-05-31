import 'package:hive/hive.dart';
import 'package:shop_hive/datasource/hive_config.dart';

part 'search_history.g.dart';

@HiveType(typeId: HiveConfig.searchHistoryTypeId)
class HiveSearchHistory {
  @HiveField(0)
  final List<String> items;

  HiveSearchHistory({required this.items});
}