import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../authentication/sign_in_screen/sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    initialization();

    _pageController = new PageController(initialPage: currentIndex);
    _pageController!.addListener(() {});
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
      body: SafeArea(
        child: Container(
          height: ScreenUtil().screenHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    currentIndex = index;
                    setState(() {});
                  },
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(left: 20, right: 20) ,
                          child: Image(
                            image: AssetImage('assets/images/onBoarding1.png'),
                            height: ScreenUtil().setHeight(1500),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(200),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: REdgeInsets.only(
                              left: 19,
                              top: 0,
                              right: 19,
                            ) ,
                            child: Text(
                              "Welcome, Student",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(120),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.36.sp,
                                height: 0.2.sp,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: ScreenUtil().setWidth(
                              1200.00,
                            ),
                            margin: REdgeInsets.only(
                              left: 19,
                              top: 20,
                              right: 19,
                            ) ,
                            child: Text(
                              "Welcome to Tech Design Center E-Learning\n The Best E-Learning to learn and improve\n your skills.",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil().setSp(50),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 5.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(left: 20, right: 20) ,
                          child: Image(
                            image: AssetImage('assets/images/onBoarding2.png'),
                            height: ScreenUtil().setHeight(1500),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(200),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: REdgeInsets.only(
                              left: 19,
                              top: 0,
                              right: 19,
                            ) ,
                            child: Text(
                              "Welcome, Student",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(120),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.36.sp,
                                height: 0.2.sp,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: ScreenUtil().setWidth(
                              1000.00,
                            ),
                            margin: REdgeInsets.only(
                              left: 19,
                              top: 20,
                              right: 19,
                            ) ,
                            child: Text(
                              "Welcome to Tech Design Center E-Learning\n The Best E-Learning to learn and improve\n your skills.",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil().setSp(50),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 5.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(left: 20, right: 20) ,
                          child: Image(
                            image: AssetImage('assets/images/onBoarding3.png'),
                            height: ScreenUtil().setHeight(1500),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(200),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: REdgeInsets.only(
                              left: 19,
                              top: 0,
                              right: 19,
                            ) ,
                            child: Text(
                              "Welcome, Student",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(120),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.36.sp,
                                height: 0.2.sp,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: ScreenUtil().setWidth(
                              1000.00,
                            ),
                            margin: REdgeInsets.only(
                              left: 19,
                              top: 20,
                              right: 19,
                            ) ,
                            child: Text(
                              "Welcome to Tech Design Center E-Learning\n The Best E-Learning to learn and improve\n your skills.",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil().setSp(50),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 5.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: REdgeInsets.only(bottom: 20) ,
                  height: ScreenUtil().setHeight(
                    150.00,
                  ),
                  margin: REdgeInsets.only(
                    left: 19,
                    top: 10,
                    right: 19,
                  ) ,
                  child: AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 6,
                      activeDotColor: Colors.indigo,
                      activeDotScale: 1.5,
                      dotColor: Colors.grey,
                      dotHeight: ScreenUtil().setHeight(
                        20.00,
                      ),
                      dotWidth: ScreenUtil().setWidth(
                        40.00,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)))),
                onPressed: () {
                  if (currentIndex < 2) {
                    _pageController!.animateToPage(currentIndex + 1,
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                        (Route<dynamic> route) => false);
                  }
                },
                child: Container(
                  width: ScreenUtil().setWidth(1000),
                  height: ScreenUtil().setHeight(190),
                  margin: REdgeInsets.only(
                    left: 19,
                    top: 12,
                    right: 19,
                  ) ,
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 65.sp),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: REdgeInsets.only(
                    left: 19,
                    top: 17,
                    right: 19,
                    bottom: 20,
                  ) ,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      padding: REdgeInsets.only(
                              bottom: 80, top: 50, left: 100, right: 100)
                           ,
                      alignment: Alignment.center,
                      width: 5.sw,
                      child: Text(
                        "Skip",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(
                            60,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 5.00.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
