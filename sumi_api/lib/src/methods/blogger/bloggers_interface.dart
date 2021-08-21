import 'package:sumi_api/src/models/models.dart';

abstract class BloggerMethodsInterace {
  Future<List<ApiBlogger>> get({
    required bool isSelected,
    bool isFavorite = false,
  });
  Future<ApiBlogger> getById(int id);
  Future<void> select(List<int> id);
}
