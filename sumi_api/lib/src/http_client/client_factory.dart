import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sumi_api/src/utils/utils.dart';

class ClientFactory {
  ClientFactory({
    required this.apiKey,
    required this.baseUrl,
    required this.apiPath,
  });

  final String apiKey;
  final String baseUrl;
  final String apiPath;

  final logColor = AnsiColor.fg(93);

  Dio? _dio;
  Dio get dio {
    _dio = _dio ?? _generateDio();
    return _dio!;
  }

  Dio _generateDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '$baseUrl/$apiPath',
        headers: {
          'Authorization': 'auth $apiKey',
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: false,
          logPrint: (msg) {
            // ignore: avoid_print
            print(logColor('$msg'));
          },
        ),
      );
    }
    if (kIsWeb) {
      return dio;
    } else {
      return dio..transformer = FlutterTransformer();
    }
  }
}
