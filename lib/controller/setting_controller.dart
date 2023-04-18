import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';

import '../model/user.dart';
import '../service/auth_service.dart';

class SettingController extends GetxController {
  Rxn<User> user = Rxn<User>();
  File? profile;

  @override
  void onInit() async {
    super.onInit();
  }
}
