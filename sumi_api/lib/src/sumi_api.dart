import 'package:dio/dio.dart';
import 'package:sumi_api/src/http_client/client.dart';
import 'package:sumi_api/src/methods/blogger/bloggers.dart';
import 'package:sumi_api/src/methods/blogger/bloggers_interface.dart';
import 'package:sumi_api/src/methods/review/review_interface.dart';
import 'package:sumi_api/src/methods/review/reviews.dart';
import 'package:sumi_api/sumi_api.dart';

class SumiApi implements SumiApiInterface {
  SumiApi({
    required String apiKey,
    required String baseUrl,
    required String apiPath,
  }) {
    _clientFactory = ClientFactory(
      apiKey: apiKey,
      baseUrl: baseUrl,
      apiPath: apiPath,
    );
  }

  late ClientFactory _clientFactory;

  Dio get _dio => _clientFactory.dio;

  @override
  BloggerMethodsInterace get blogger => BloggerMethods(_dio);

  @override
  ReviewMethodsInterface get review => ReviewsMethods(_dio);
}
