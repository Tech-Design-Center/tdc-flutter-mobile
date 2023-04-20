import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/core/extension/string_extension.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_one_screen.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

import '../../../../controller/setting_controller.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool obsecur = true;
  bool _passwordVisible = false;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? profileImage = authController.user.value?.imageURL;

  bool _isTextFieldEmpty = true;

  bool _passwordsMatch = true;

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {
        _isTextFieldEmpty = passwordController.text.isEmpty;
      });
    });

    confirmPasswordController.addListener(() {
      setState(() {
        _isTextFieldEmpty = confirmPasswordController.text.isEmpty;
      });
    });

    passwordController.addListener(_verifyPasswords);
    confirmPasswordController.addListener(_verifyPasswords);
  }

  void _verifyPasswords() {
    setState(() {
      _passwordsMatch = passwordController.text == confirmPasswordController.text;
    });
  }

  void _saveData() {
    _passwordsMatch;
    // Perform save operation
    print('saved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(
              name: 'Update Profile',
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                //default
                Positioned(
                    child: Container(
                  width: ScreenUtil().screenWidth,
                  height: 1000.h,
                  // decoration: BoxDecoration(color: Colors.red),
                )),

                //background
                Positioned(
                  top: 0,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: 500.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgRectangle792), fit: BoxFit.cover),
                    ),
                  ),
                ),

                //Avatar
                Positioned(
                  bottom: 20,
                  child: Column(
                    children: [
                      //profile image
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          //avatar
                          Positioned(
                              child: CircleAvatar(
                                  radius: 280.r, foregroundImage: NetworkImage(profileImage!))),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Text(
                        "Student ID : # ${authController.user.value?.id ?? 0}",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorConstant.bluegray700,
                          fontSize: ScreenUtil().setSp(
                            50,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight,
                      // decoration: BoxDecoration(color: Colors.yellow),
                    )),
                Positioned(
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(1700),
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //body
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Current Password',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: currentPasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  obscureText: !_passwordVisible,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty";
                                    }
                                    return null;
                                  },
                                  //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color: Colors.grey)),

                                    hintText: 'Enter your current password',
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Password',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  obscureText: !_passwordVisible,
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "This field can't be empty";
                                    }
                                    return null;
                                  },
                                  //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color: Colors.grey)),

                                    hintText: 'Enter your new password',
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40, bottom: 20, left: 150, right: 150).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Retype Password',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  obscureText: !_passwordVisible,
                                  validator: (String? value) {
                                    if (_passwordsMatch = true) {
                                      return "";
                                    }
                                    return "Passwords do not match";
                                  },
                                  //This will obscure text dynamically
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color: Colors.grey)),

                                    hintText: 'Enter retype your password',
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Text(
                                  _passwordsMatch ? '' : 'Passwords do not match',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 100, bottom: 200).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _isTextFieldEmpty
                                    ? ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStatePropertyAll<Color>(
                                                ColorConstant.blue51),
                                            shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18.0),
                                                        side: BorderSide(
                                                            color: ColorConstant.blue51)))),
                                        onPressed: () {},
                                        child: Container(
                                          width: ScreenUtil().setWidth(900),
                                          height: ScreenUtil().setHeight(190),
                                          margin: EdgeInsets.only(
                                            left: 19,
                                            top: 20,
                                            right: 19,
                                          ).r,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Save',
                                            style: TextStyle(fontSize: 65.sp),
                                          ),
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ButtonStyle(
                                            shape:
                                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18.0),
                                                        side: BorderSide(color: Colors.blue)))),
                                        onPressed: () {
                                          _saveData();
                                          authController.changePassword(
                                              email: authController.user.value!.email!,
                                              currentPassword: currentPasswordController.text,
                                              password: passwordController.text,
                                              passwordConfirmation: confirmPasswordController.text);
                                        },
                                        child: Container(
                                          width: ScreenUtil().setWidth(900),
                                          height: ScreenUtil().setHeight(190),
                                          margin: EdgeInsets.only(
                                            left: 19,
                                            top: 20,
                                            right: 19,
                                          ).r,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Save',
                                            style: TextStyle(fontSize: 65.sp),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
