import 'package:dio/dio.dart';
import 'package:sumi_api/src/methods/blogger/bloggers_interface.dart';
import 'package:sumi_api/src/models/blogger/blogger.dart';
import 'package:sumi_api/src/utils/exceptions/exceptions.dart';
export 'package:sumi_api/src/methods/blogger/bloggers_interface.dart';

class BloggerMethods extends BloggerMethodsInterace {
  BloggerMethods(this._dio);
  final Dio _dio;

  @override
  Future<List<ApiBlogger>> get({
    required bool isSelected,
    bool isFavorite = false,
  }) async {
    var bloggers = <ApiBlogger>[];
    try {
      final res = await _dio.get(
        '/blogger',
        queryParameters: {
          'is_selected': isSelected,
          'is_favorite': isFavorite,
        },
      );
      if (res.statusCode == 200) {
        if (res.data != null) {
          bloggers = _parseBloggers(res.data);
        }
      } else {
        throw badRequestException;
      }
    } on Exception catch (e) {
      throw SumiApiException(message: '$e');
    }
    return bloggers;
  }

  @override
  Future<void> select(List<int> id) async {
    try {
      final res = await _dio.patch(
        '/blogger/select?ids=$id',
      );
      if (res.statusCode != 200) {
        throw badRequestException;
      }
    } on Exception catch (e) {
      throw SumiApiException(message: '$e');
    }
  }

  List<ApiBlogger> _parseBloggers(dynamic data) {
    return List<ApiBlogger>.from(
      (data as Iterable<dynamic>).map(
        (b) => ApiBlogger.fromJson(b as Map<String, dynamic>),
      ),
    );
  }
}
