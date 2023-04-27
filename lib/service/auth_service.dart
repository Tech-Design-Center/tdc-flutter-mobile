import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteAuthService {
  var client = http.Client();

  Future<dynamic> signUp({
    required String email,
    required String password,
  }) async {
    var body = {"username": email, "email": email, "password": password};
    var response = await client.post(
      Uri.parse('$baseUrl/api/auth/local/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> createProfile({
    required String fullName,
    required int phoneNumber,
    required String token,
  }) async {
    var body = {
      "fullName": fullName,
      "phoneNumber": phoneNumber,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> signIn({
    required String? email,
    required String? password,
  }) async {
    var body = {"identifier": email, "password": password};
    var response = await client.post(
      Uri.parse('$baseUrl/api/auth/local'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> getProfile({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
    );
    return response;
  }

  Future<dynamic> updateProfile({
    required String? token,
    required String? fullName,
    required String? surName,
    required String? name,
    required String? email,
    required String? birthday,
    required String? phoneNumber,
    required String? imageURL,
    required String? gender,
  }) async {
    var body = {
      "email": email,
      "fullName": fullName,
      "surName": surName,
      "name": name,
      "birthday": birthday,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "imageURL": imageURL,
    };

    var response = await client.put(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> changePassword({
    required String? token,
    required String? currentPassword,
    required String? password,
    required String? passwordConfirmation,
  }) async {
    var body = {
      "currentPassword": currentPassword,
      "password": password,
      "passwordConfirmation": passwordConfirmation,
    };

    var response = await client.post(
      Uri.parse('$baseUrl/api/auth/change-password'),
      headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
      body: jsonEncode(body),
    );
    return response;
  }
}
