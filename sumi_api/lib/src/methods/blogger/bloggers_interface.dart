import 'package:sumi_api/src/models/models.dart';

abstract class BloggerMethodsInterace {
  Future<List<ApiBlogger>> get();
  Future<void> select(List<int> id);
}
