/// Exception class for services.
class SumiApiException implements Exception {
  SumiApiException({
    this.message,
    this.httpCode,
  });

  String? message;
  int? httpCode;

  @override
  String toString() => '''
  \SumiApiException 
    ${message != null ? 'Message: $message' : ''}
    ${httpCode != null ? 'HTTP code: $httpCode' : ''}
    ''';
}

final badRequestException = SumiApiException(
  message: 'Bad Request',
);
