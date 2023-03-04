import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/course_list_screen/course_list_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/homepage_expand_screen/homepage_expand_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/setting_screen/setting_screen.dart';

// ignore: must_be_immutable
class BottomSheetBar extends StatefulWidget {
  int selectedNavBarIndex;
  BottomSheetBar({this.selectedNavBarIndex = 0});

  @override
  State<BottomSheetBar> createState() => _BottomSheetBarState();
}

class _BottomSheetBarState extends State<BottomSheetBar>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    HomepageExpandScreen(),
    CourseListScreen(),
    SettingScreen(),
  ];

  final keyThree = GlobalKey();

  bool pop = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Init Floating Action Bubble
      floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 0).r,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.selectedNavBarIndex = 1;
              });
            },
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            child: Image(
              image: AssetImage('assets/images/fab.png'),
              height: ScreenUtil().setHeight(80),
              width: ScreenUtil().setWidth(80),
            ),
          )),

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
                            "Are you sure",
                            style:
                                TextStyle(fontSize: 13, fontFamily: "Poppins"),
                          ),
                          title: Text(
                            "Do you want to exit the app?",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 13, fontFamily: "Poppins"),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontFamily: "Poppins"),
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
