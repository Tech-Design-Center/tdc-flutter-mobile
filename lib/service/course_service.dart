import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class CourseService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/users';

  Future<dynamic> get({required String email}) async {
    var response = await client.get(Uri.parse(
        '$remoteUrl?populate=courses.image,courses.playlist_video_urls.video_urls&filters[email][\$eq]=$email'));
    return response;
  }
}
