import 'package:sumi_api/src/methods/blogger/bloggers.dart';
import 'package:sumi_api/src/methods/review/review_interface.dart';

abstract class SumiApiInterface {
  BloggerMethodsInterace get blogger;
  ReviewMethodsInterface get review;
}
