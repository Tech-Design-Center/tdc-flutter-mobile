import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/banners';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse('$remoteUrl?populate=image'));
    print('banner $response');
    return response;
  }
}
