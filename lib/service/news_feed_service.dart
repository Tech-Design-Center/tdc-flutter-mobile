import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class NewsFeedService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/news-feeds';

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?populate=image,poster'));
    return response;
  }
}
