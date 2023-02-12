import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/view/screen/home_screen.dart';

import '../model/user.dart';
import '../service/remote_service/remote_auth_service.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();

  @override
  void onInit() async {
    super.onInit();
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
        var userResult = await RemoteAuthService().createProfile(
            fullName: fullName, phoneNumber: phoneNumber, token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to TDC!");
          Get.to(() => HomeScreen());
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
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to TDC!");
          Get.to(() => HomeScreen());
        } else {
          EasyLoading.showError('Something wrong1. Try again!');
        }
      } else {
        EasyLoading.showError('Username/password2 wrong');
      }
    } catch (e) {
      print('Sign up');

      debugPrint(e.toString());
      print(e.toString());
      EasyLoading.showError('Something wrong3. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
  }
}
