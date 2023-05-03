import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class NotificationService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/notifications';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> post({
    required String? title,
    required String? description,
  }) async {
    var body = {
      "data": {"title": title, "description": description}
    };
    var response = await client.post(
      Uri.parse(remoteUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }
}
