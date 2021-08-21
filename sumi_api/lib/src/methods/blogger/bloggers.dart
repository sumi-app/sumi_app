import 'package:dio/dio.dart';
import 'package:sumi_api/src/methods/blogger/bloggers_interface.dart';
import 'package:sumi_api/src/models/blogger/blogger.dart';
import 'package:sumi_api/src/utils/exceptions/exceptions.dart';
export 'package:sumi_api/src/methods/blogger/bloggers_interface.dart';

class BloggerMethods extends BloggerMethodsInterace {
  BloggerMethods(this._dio);
  final Dio _dio;

  @override
  Future<List<ApiBlogger>> get() async {
    var bloggers = <ApiBlogger>[];
    try {
      final res = await _dio.get('/blogger');
      if (res.statusCode == 200 && res.data != null) {
        bloggers = _parseBloggers(res.data);
      } else {
        throw badRequestException;
      }
    } on Exception catch (e) {
      throw SumiApiException(message: '$e');
    }
    return bloggers;
  }

  List<ApiBlogger> _parseBloggers(dynamic data) {
    return List<ApiBlogger>.from(
      (data as Iterable<dynamic>).map(
        (b) => ApiBlogger.fromJson(b as Map<String, dynamic>),
      ),
    );
  }
}
