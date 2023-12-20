import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class SettingController extends GetxController {
  Rxn<User> user = Rxn<User>();
  File? profile;

  void pickImage() async {
    EasyLoading.show(status: 'loading...');

    final pickImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );

    final path = 'profiles/${pickImage!.name}';
    final file = File(pickImage.path);
    // FirebaseAuth.instance.currentUser!.uid

    Reference ref = FirebaseStorage.instance.ref().child(path);

    await ref.putFile(file);

    ref.getDownloadURL().then((imageURL) async {
      debugPrint('value: $imageURL');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('imageURL', imageURL);
    });
    profile = File(pickImage.path);
    update();
    EasyLoading.dismiss();
  }
}
