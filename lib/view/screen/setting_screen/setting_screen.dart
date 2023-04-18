import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/screen/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/setting_screen/update_profile_screen/update_profile_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/setting_screen/widgets/section_card.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_one_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin {
  String profileImage =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                  bottom: 0,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(
                            bottom: 0,
                            left: 29,
                            right: 29,
                          ),
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
                              child: CircleAvatar(
                                foregroundImage: NetworkImage(
                                  profileImage,
                                ),
                                radius: 225.r,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.only(
                            left: 29,
                            top: 19,
                            right: 29,
                          ),
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
                          margin: REdgeInsets.only(
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
          Expanded(
            child: Stack(
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
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //body
                          InkWell(
                              onTap: () {
                                Get.to(() => UpdateProfileScreen());
                              },
                              child:
                                  SectionSettingCard(name: 'Update Profile', icon: Icons.person)),
                          InkWell(
                              onTap: () {
                                Get.to(() => ChangePasswordScreen());
                              },
                              child: SectionSettingCard(name: 'Change Password', icon: Icons.key)),

                          SizedBox(
                            height: 80.h,
                          ),
                          SectionSettingCard(name: 'Help & Supports', icon: Icons.warning),
                          SectionSettingCard(name: 'About Us', icon: Icons.people),
                          SectionSettingCard(name: 'Term & Conditions', icon: Icons.task),
                          Padding(
                            padding: REdgeInsets.only(top: 200, bottom: 400).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    authController.signOut();
                                  },
                                  child: Container(
                                    height: ScreenUtil().setHeight(200),
                                    width: ScreenUtil().setWidth(1000),
                                    margin: REdgeInsets.only(
                                      right: 24,
                                      left: 24,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.redA700A2,
                                      borderRadius: BorderRadius.circular(30).r,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                              fontSize: 80.sp,
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
          ),
        ],
      ),
    );
  }
}
