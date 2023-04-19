import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemotePopularService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/populars';

  Future<dynamic> get() async {
    var response = await client
        .get(Uri.parse('$remoteUrl?populate=course.image,course.playlist_video_urls.video_urls'));
    return response;
  }
}
