import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';

import '../model/user.dart';
import '../service/auth_service.dart';
import '../view/screen/authentication/sign_in_screen/sign_in_screen.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();
  var token;

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var userResult = await RemoteAuthService().getProfile(token: token);
    if (userResult.statusCode == 200) {
      user.value = userFromJson(userResult.body);
      Get.offAll(() => DashboardScreen());
    } else {
      EasyLoading.showError('Something wrong. Try again!');
    }
  }

  void signUp(
      {required String fullName,
      required int phoneNumber,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      var result = await RemoteAuthService().signUp(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        var userResult = await RemoteAuthService().createProfile(
            fullName: fullName, phoneNumber: phoneNumber, token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to TDC!");
          Get.offAll(() => DashboardScreen());
        } else {
          EasyLoading.showError('Something wrong1. Try again!');
        }
      } else {
        EasyLoading.showError('Something wrong2. Try again!');
      }
    } catch (e) {
      print(e.toString());
      EasyLoading.showError('Something wrong3. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().getProfile(token: token);

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to TDC!");
          Get.offAll(() => DashboardScreen());
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Username/password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      print(e.toString());
      EasyLoading.showError('Something wrong2. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    user.value = null;
    Get.offAll(() => SignInScreen());
  }
}
