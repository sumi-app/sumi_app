import 'package:sumi_api/src/models/models.dart';
import 'package:sumi_api/src/models/review/review.dart';

abstract class ReviewMethodsInterface {
  Future<List<ApiReview>> get();
}
