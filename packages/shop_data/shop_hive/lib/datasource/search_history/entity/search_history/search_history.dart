import 'package:shop_hive/datasource/hive_config.dart';
import 'package:hive/hive.dart';

part 'search_history.g.dart';


@HiveType(typeId: HiveConfig.searchHistoryTypeId)
class HiveSearchHistoryItem{
  @HiveField(0)
  final int order;

  @HiveField(1)
  final String query;

  @HiveField(2)
  final int? product;

  HiveSearchHistoryItem({required this.order,required this.query, this.product});
}