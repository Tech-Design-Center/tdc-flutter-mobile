import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/main.dart';
import 'package:tdc_frontend_mobile/model/course.dart';
import 'package:tdc_frontend_mobile/view/screen/my_learning/my_course/my_course_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/homepage_expand_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/setting/setting_screen.dart';

import '../model/user.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatefulWidget {
  int selectedNavBarIndex;
  DashboardScreen({super.key, this.selectedNavBarIndex = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    HomepageExpandScreen(),
    MyCourseScreen(),
    SettingScreen(),
  ];

  final keyThree = GlobalKey();

  bool pop = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Init Floating Action Bubble
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myCourseController.getByEmail(email: authController.user.value!.email);
          setState(() {
            widget.selectedNavBarIndex = 1;
          });
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: Image(
          image: const AssetImage('assets/images/fab.png'),
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(80),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: ColorConstant.bluegray300,
        selectedLabelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(
            12,
          ),
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w900,
        ),
        unselectedLabelStyle: TextStyle(
          // color: ColorConstant.gray600,
          fontSize: ScreenUtil().setSp(
            12,
          ),
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w400,
        ),
        currentIndex: widget.selectedNavBarIndex,
        onTap: (index) {
          setState(() {
            if (index != 1) widget.selectedNavBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ImageConstant.inActiveHome,
              color: ColorConstant.bluegray10087,
            ),
            activeIcon: SvgPicture.asset(
              ImageConstant.activeHome,
              height: ScreenUtil().setHeight(80),
              width: ScreenUtil().setWidth(80),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageConstant.inActive3,
                color: Colors.transparent,
              ),
              label: "Course"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageConstant.inActive4,
              ),
              activeIcon: SvgPicture.asset(
                ImageConstant.active4,
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(80),
              ),
              label: "Profile"),
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            return (await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text(
                            "Are you sure ?".tr,
                            style: TextStyle(fontSize: 50.sp, fontFamily: "Poppins"),
                          ),
                          title: Text(
                            "Do you want to exit the app?".tr,
                            style: TextStyle(
                                fontSize: 60.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                "No".tr,
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 50.sp, fontFamily: "Poppins"),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text(
                                "Yes".tr,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 50.sp, fontFamily: "Poppins"),
                              ),
                            ),
                          ],
                        ))) ??
                false;
          },
          child: screens[widget.selectedNavBarIndex]),
    );
  }
}
