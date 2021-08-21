import 'package:dio/dio.dart';
import 'package:sumi_api/src/methods/review/review_interface.dart';
import 'package:sumi_api/src/models/review/review.dart';
import 'package:sumi_api/src/utils/utils.dart';

class ReviewsMethods implements ReviewMethodsInterface {
  ReviewsMethods(this._dio);
  final Dio _dio;

  @override
  Future<List<ApiReview>> get() async {
    var reviews = <ApiReview>[];
    try {
      final res = await _dio.get('/review');
      if (res.statusCode == 200) {
        if (res.data != null) {
          reviews = _parseReviews(res.data);
        }
      } else {
        throw badRequestException;
      }
    } on Exception catch (e) {
      throw SumiApiException(message: '$e');
    }
    return reviews;
  }

  List<ApiReview> _parseReviews(dynamic data) {
    return List<ApiReview>.from(
      (data as Iterable<dynamic>).map(
        (b) => ApiReview.fromJson(b as Map<String, dynamic>),
      ),
    );
  }
}
