import 'package:url_launcher/url_launcher.dart';

abstract class U {
  static Future<void> open(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
