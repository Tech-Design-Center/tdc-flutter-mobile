
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/core/extension/string_extension.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_one_screen.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool obsecur = true;
  bool _passwordVisible = false;
  TextEditingController passwordController = TextEditingController();

  String profileImage =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(name: 'Update Profile',),
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
                    width:ScreenUtil().screenWidth,
                    height: 500.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgRectangle792), fit: BoxFit.cover),
                    ),
                  ),
                ),

//Avatar
                Positioned(
                    bottom: 0,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 0,
                              left: 29,
                              right: 29,
                            ).r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(
                                  40.00,
                                ),
                              ),
                              child: GestureDetector(
                                  onTap: () {
                                    if (authController.user.value?.fullName == null) {
                                      Get.offAll(() => OnboardingScreen());
                                    } else {
                                      profileImage = '${authController.user.value?.image}';
                                    }
                                  },
                                  child:
                                  CircleAvatar(
                                    foregroundImage:
                                    NetworkImage(profileImage),
                                    radius: 225.r,
                                  )
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 29,
                              top: 19,
                              right: 29,
                            ).r,
                            child: GestureDetector(
                              onTap: () {
                                if (authController.user.value?.fullName == null) {
                                  Get.offAll(() => OnboardingScreen());
                                }
                              },
                              child: Text(
                                authController.user.value?.fullName ?? "Sign in your account",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(
                                    75,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.36,
                                  height: 1.00,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(
                              600.00,
                            ),
                            margin: EdgeInsets.only(
                              bottom: 25,
                              left: 29,
                              top: 15,
                              right: 29,
                            ),
                            child: Text(
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
                          ),
                        ])),
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
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Old Password',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
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

                                    hintText: 'Enter your old password',
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('New Password',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
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
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 150,right:150 ).r,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Retype Password',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(65),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 40.h,),
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

                                    hintText: 'Enter retype your password',
                                    // Here is key idea
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                            padding: const EdgeInsets.only(top: 100, bottom: 200).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    height: ScreenUtil().setHeight(200),
                                    width: ScreenUtil().setWidth(1000),
                                    margin: EdgeInsets.only(
                                      right: 24,
                                      left: 24,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.blueA200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Save",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
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
