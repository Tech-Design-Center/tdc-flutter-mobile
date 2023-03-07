import 'package:http/http.dart' as http;

import '../../core/constants/const.dart';

class RemotePopularService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/populars';

  Future<dynamic> get() async {
    var response =
        await client.get(Uri.parse('$remoteUrl?populate=course,course.image'));
    return response;
  }
}