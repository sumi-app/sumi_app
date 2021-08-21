import 'package:sumi_api/sumi_api.dart';

abstract class ApiProvider {
  static SumiApiInterface _sdk = SumiApi(
    //TODO:
    apiKey: '',
    baseUrl: 'https://sumi-api.herokuapp.com',
    apiPath: 'api',
  );
  static SumiApiInterface get sdk => _sdk;
}
