import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class CourseService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/courses';

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?populate=image,playlist_video_urls.video_urls'));
    return response;
  }
}
