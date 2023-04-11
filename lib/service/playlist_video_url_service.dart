import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class PlaylistVideoURLService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/playlist-video-urls';

  Future<dynamic> get({required name}) async {
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=video_urls&filters[name][\$eq]=$name'));
    return response;
  }
}
