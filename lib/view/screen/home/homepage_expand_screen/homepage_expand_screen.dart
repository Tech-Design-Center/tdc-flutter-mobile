import 'dart:async';
import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/model/category.dart';
import 'package:tdc_frontend_mobile/model/popular.dart';
import 'package:tdc_frontend_mobile/service/category_service.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/categories_screen/categories_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/carousel_slider/carousel_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/carousel_slider/carousel_slider_view.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/category/category_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/category/category_list_view.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/popular/popular_list_view.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/popular/popular_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/recommend/recommend_list_view.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/recommend/recommend_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/newsfeed_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/text_title_home_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/setting/setting_screen.dart';

import '../../../../controller/controllers.dart';

import '../../../../local_constant.dart';
import '../../../../model/recommend.dart';
import '../../authentication/sign_in_screen/sign_in_screen.dart';
import '../../welcome/onboarding_screen.dart';

import 'package:flutter/material.dart';

import '../notification_screen/notification_screen.dart';
import '../popular_screen/populars_screen.dart';
import '../recommend_screen/recommends_screen.dart';

class HomepageExpandScreen extends StatefulWidget {
  @override
  State<HomepageExpandScreen> createState() => _HomepageExpandScreenState();
}

class _HomepageExpandScreenState extends State<HomepageExpandScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String profileImage = authController.user.value?.imageURL ??
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream = Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        const SnackBar(
          content: Text('Refresh complete'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ClipRRect(
        borderRadius:
            BorderRadius.only(topRight: Radius.circular(35).w, bottomRight: Radius.circular(35).w),
        child: Drawer(
            backgroundColor: ColorConstant.whiteA700,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.only(left: 20, right: 20, top: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 50, right: 20).r,
                    child: GestureDetector(
                      onTap: () {
                        if (authController.user.value?.fullName == null) {
                          Get.offAll(() => OnboardingScreen());
                        }
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: CircleAvatar(
                              foregroundImage: NetworkImage(profileImage!),
                              radius: 100.r,
                            ),
                          ),
                          20.horizontalSpace,
                          Padding(
                            padding: EdgeInsets.only(left: 30).r,
                            child: Text(
                              authController.user.value?.fullName ?? "Sign in your account".tr,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(70),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                    child: InkWell(
                      onTap: () {
                        Get.to(SettingScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                ImageConstant.settings,
                                width: ScreenUtil().setWidth(100),
                                height: ScreenUtil().setHeight(100),
                              ),
                              20.horizontalSpace,
                              Text(
                                'Setting-and-Privacy'.tr,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil().setSp(60),
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
                  Padding(
                    padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                    child: InkWell(
                      onTap: () {
                        Get.to(NewsFeedScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.feed,
                                size: ScreenUtil().setWidth(100),


                              ),
                              20.horizontalSpace,
                              Text(
                                'News Feed'.tr,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: ScreenUtil().setSp(60),
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
                  Padding(
                    padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageConstant.help,
                              width: ScreenUtil().setWidth(100),
                              height: ScreenUtil().setHeight(100),
                            ),
                            20.horizontalSpace,
                            Text(
                              'Help-and-Support'.tr,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(60),
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
                  Padding(
                    padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          right: 0,
                        ).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 1,
                                    bottom: 1,
                                  ).r,
                                  child: Image.asset(
                                    ImageConstant.settings,
                                    width: ScreenUtil().setWidth(100),
                                    height: ScreenUtil().setHeight(100),
                                  ),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(25)),
                                Text(
                                  "Language".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(60),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                PopupMenuButton(
                                  itemBuilder: (BuildContext context) => [
                                    const PopupMenuItem(
                                      value: Locale('en', 'US'),
                                      child: Text('English'),
                                    ),
                                    const PopupMenuItem(
                                      value: Locale('km', 'KH'),
                                      child: Text('ភាសាខ្មែរ'),
                                    ),
                                  ],
                                  onSelected: (value) async {
                                    Navigator.of(context).pop();
                                    setLocale(value.languageCode, value.countryCode!);
                                    Get.updateLocale(value);
                                  },
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorConstant.indigoA200,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(120),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          if (authController.user.value?.fullName == null) {
                            Get.offAll(() => OnboardingScreen());
                          } else {
                            profileImage = '${authController.user.value?.imageURL}';

                            authController.signOut();
                          }
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(180),
                          width: ScreenUtil().setWidth(550),
                          margin: EdgeInsets.only(
                            left: 24,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.indigoA200,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              authController.user.value?.fullName != null
                                  ? 'Logout'.tr
                                  : 'Login'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.all(60),
            child: Column(
              children: [
                //profile and notification
                Padding(
                  padding: REdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (authController.user.value?.fullName == null) {
                                      _scaffoldKey.currentState!.openDrawer();
                                    } else {
                                      _scaffoldKey.currentState!.openDrawer();
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 100.r,
                                    foregroundImage: NetworkImage(profileImage!),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: REdgeInsets.only(
                                        left: 30,
                                        right: 0,
                                      ),
                                      child: Text(
                                        "welcomeback".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.gray600,
                                          fontSize: ScreenUtil().setSp(
                                            50,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: REdgeInsets.only(
                                        left: 30,
                                        top: 7,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (authController.user.value?.fullName == null) {
                                            _scaffoldKey.currentState!.openDrawer();
                                          } else {
                                            _scaffoldKey.currentState!.openDrawer();
                                          }
                                        },
                                        child: Text(
                                          authController.user.value?.fullName ??
                                              "Sign in your account".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: ScreenUtil().setSp(
                                              60,
                                            ),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.36,
                                            height: 1.00,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //notification
                      InkWell(
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        },
                        child: Container(
                          height: ScreenUtil().setHeight(
                            120.00,
                          ),
                          width: ScreenUtil().setWidth(
                            120.00,
                          ),
                          margin: REdgeInsets.only(
                            top: 4,
                            bottom: 4,
                          ),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: REdgeInsets.all(0),
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(
                                  8.00,
                                ),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: REdgeInsets.only(
                                      left: 11,
                                      top: 10,
                                      right: 11,
                                      bottom: 10,
                                    ),
                                    child: Image(
                                      image: AssetImage(
                                        ImageConstant.imgNotification,
                                      ),
                                      height: ScreenUtil().setHeight(400),
                                      width: ScreenUtil().setWidth(400),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: ScreenUtil().setHeight(
                                      40.00,
                                    ),
                                    width: ScreenUtil().setWidth(
                                      40.00,
                                    ),
                                    margin: REdgeInsets.only(
                                      left: 10,
                                      top: 9,
                                      right: 9,
                                      bottom: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.deepOrange400,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          30.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //carousel data
                        Obx(() {
                          if (homeController.bannerList.isNotEmpty) {
                            return CarouselSliderView(
                              bannerList: homeController.bannerList,
                            );
                          } else {
                            return const CarouselLoading();
                          }
                        }),

                        //categories title
                        textTitleHomeScreen(
                          name: 'Categories'.tr,
                          screen: CategoriesScreen(),
                        ),

                        //categories data
                        Obx(() {
                          if (homeController.categoryList.isNotEmpty) {
                            return CategoryListView(
                              categories: homeController.categoryList,
                              scrollController: _scrollController,
                            );
                          } else {
                            return const CategoryLoading();
                          }
                        }),

                        //recommended
                        textTitleHomeScreen(
                          name: 'Recommends'.tr,
                          screen: RecommendsScreen(),
                        ),

                        //recommend data
                        Obx(() {
                          if (homeController.recommendList.isNotEmpty) {
                            return RecommendListView(
                              recommendList: homeController.recommendList,
                              scrollController: _scrollController,
                            );
                          } else {
                            return const RecommendLoading();
                          }
                        }),
                        SizedBox(
                          height: ScreenUtil().setHeight(100),
                        ),

                        //Popular
                        textTitleHomeScreen(
                          name: 'Populars'.tr,
                          screen: PopularsScreen(),
                        ),

                        //popular data
                        Obx(() {
                          if (homeController.popularList.isNotEmpty) {
                            return PopularListView(
                              popularList: homeController.popularList,
                              scrollController: _scrollController,
                            );
                          } else {
                            return const PopularLoading();
                          }
                        }),
                        SizedBox(
                          height: ScreenUtil().setHeight(200),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
