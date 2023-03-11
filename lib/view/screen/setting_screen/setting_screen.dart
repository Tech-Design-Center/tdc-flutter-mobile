import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/controller/setting_controller.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/coursesList.dart';
import 'package:tdc_frontend_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/Screen/sign_in_screen/sign_in_screen.dart';

import '../../../core/constants/const.dart';
import '../homepage_expand_screen/light_settings_language_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  bool status = false;

  bool switchval2 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: 100.w,
              height: 200.h,
            ),
            Positioned(
              top: 0,
              child: Container(
                height: ScreenUtil().setHeight(900),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageConstant.imgRectangle792,
                        width: ScreenUtil().setWidth(1500),
                        height: ScreenUtil().setHeight(1200),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: ScreenUtil().screenHeight,
                width: ScreenUtil().screenWidth,
                margin: EdgeInsets.only(
                  top: 101,
                  bottom: 0,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.gray100,
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(
                      30.00,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: ScreenUtil().screenHeight,
                margin: EdgeInsets.only(
                  bottom: 80,
                  left: 20,
                  top: 0,
                  right: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //popular data
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
                        child: CircleAvatar(
                          foregroundImage: NetworkImage(
                            '$baseUrl${authController.user.value?.image}' ??
                                ImageConstant.imgImage1,
                          ),
                          radius: 225.r,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 29,
                        top: 19,
                        right: 29,
                      ).r,
                      child: Text(
                        authController.user.value?.fullName ??
                            "Sign in your account",
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 0).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>SignInScreen()),
                                    );
                                    */
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(220),
                                      width: ScreenUtil().setWidth(1130),
                                      margin: EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  ImageConstant.settings,
                                                  width: ScreenUtil()
                                                      .setWidth(100),
                                                  height: ScreenUtil()
                                                      .setHeight(100),
                                                ),
                                                20.horizontalSpace,
                                                Text(
                                                  'Update Profile',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        ScreenUtil().setSp(60),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstant.indigoA200,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>SignInScreen()),
                                    );
                                    */
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(220),
                                      width: ScreenUtil().setWidth(1130),
                                      margin: EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  ImageConstant.settings,
                                                  width: ScreenUtil()
                                                      .setWidth(100),
                                                  height: ScreenUtil()
                                                      .setHeight(100),
                                                ),
                                                20.horizontalSpace,
                                                Text(
                                                  'Change Password',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        ScreenUtil().setSp(60),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstant.indigoA200,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 100).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>SignInScreen()),
                                    );
                                    */
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(220),
                                      width: ScreenUtil().setWidth(1130),
                                      margin: EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  ImageConstant.settings,
                                                  width: ScreenUtil()
                                                      .setWidth(100),
                                                  height: ScreenUtil()
                                                      .setHeight(100),
                                                ),
                                                20.horizontalSpace,
                                                Text(
                                                  'Help and Support',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        ScreenUtil().setSp(60),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstant.indigoA200,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>SignInScreen()),
                                    );
                                    */
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(220),
                                      width: ScreenUtil().setWidth(1130),
                                      margin: EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  ImageConstant.settings,
                                                  width: ScreenUtil()
                                                      .setWidth(100),
                                                  height: ScreenUtil()
                                                      .setHeight(100),
                                                ),
                                                20.horizontalSpace,
                                                Text(
                                                  'About us',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        ScreenUtil().setSp(60),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstant.indigoA200,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      /*
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)
                                      =>SignInScreen()),
                                    );
                                    */
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(220),
                                      width: ScreenUtil().setWidth(1130),
                                      margin: EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.whiteA700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  ImageConstant.settings,
                                                  width: ScreenUtil()
                                                      .setWidth(100),
                                                  height: ScreenUtil()
                                                      .setHeight(100),
                                                ),
                                                20.horizontalSpace,
                                                Text(
                                                  'Term & Condition',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize:
                                                        ScreenUtil().setSp(60),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: ColorConstant.indigoA200,
                                              size: 20,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 100).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      settingController.signOut();
                                    },
                                    child: Container(
                                      height: ScreenUtil().setHeight(200),
                                      width: ScreenUtil().setWidth(1000),
                                      margin: EdgeInsets.only(
                                        right: 24,
                                        left: 24,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.redA700A2,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Logout",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
