import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/controller/setting_controller.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/local_data/coursesList.dart';
import 'package:tdc_frontend_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/setting_screen/widgets/section_card.dart';

import '../../../core/constants/base_url.dart';

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
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              //default
              Positioned(
                  child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 250,
                // decoration: BoxDecoration(color: Colors.red),
              )),

              //background
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgRectangle792),
                        fit: BoxFit.cover),
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
                            child: CircleAvatar(
                              foregroundImage: NetworkImage(
                                '${authController.user.value?.image}' ??
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
                      ])),
            ],
          ),
          Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    // decoration: BoxDecoration(color: Colors.yellow),
                  )),
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.54,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //body
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        SectionSettingCard(
                            name: 'Update Profile',
                            screen: 'DashboardScreen()'),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 100, bottom: 200).r,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
