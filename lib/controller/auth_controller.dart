import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/authentication/sign_in_screen/sign_in_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_screen.dart';

import '../model/user.dart';
import '../service/auth_service.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();
  var token;

  @override
  void onInit() async {
    super.onInit();

    checkToken();
  }

  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var userResult = await RemoteAuthService().getProfile(token: token);
    if (userResult.statusCode == 200) {
      user.value = userFromJson(userResult.body);
      Get.offAll(() => DashboardScreen(selectedNavBarIndex: 0,));
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

        var userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, phoneNumber: phoneNumber, token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to TDC!");
          Get.offAll(() => DashboardScreen(selectedNavBarIndex: 0,));
        } else {
          EasyLoading.showError('Something wrong1. Try again!');
        }
      } else {
        EasyLoading.showError('Something wrong2. Try again!');
      }
    } catch (e) {
      debugPrint(e.toString());
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
          Get.offAll(() => DashboardScreen(selectedNavBarIndex:  0,));
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void updateUser(
      {required String email,
      required String password,
      required String? oldEmail,
      required String surName,
      required String name,
      required String phoneNumber,
      required String? imageURL,
      required String fullName,
      required String gender,
      required String birthday}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      var result = await RemoteAuthService().signIn(
        email: oldEmail,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().updateProfile(
            token: token,
            birthday: birthday,
            phoneNumber: phoneNumber,
            surName: surName,
            imageURL: imageURL,
            email: email,
            name: name,
            fullName: fullName,
            gender: gender);

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Update Profile Successfully!");
          Get.back();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Password is wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void changePassword({
    required String email,
    required String? currentPassword,
    required String? password,
    required String? passwordConfirmation,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      var result = await RemoteAuthService().signIn(
        email: email,
        password: currentPassword,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().changePassword(
          token: token,
          currentPassword: currentPassword,
          password: password,
          passwordConfirmation: passwordConfirmation,
        );

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Update Password Successfully!");
          Get.offAll(() => SignInScreen());
        } else {
          EasyLoading.showError('Something wrong1. Try again!');
        }
      } else {
        EasyLoading.showError('Password is wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong2. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    user.value = null;
    Get.offAll(() => OnboardingScreen());
  }
}
