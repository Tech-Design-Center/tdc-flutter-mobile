import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

import '../course_details_two_screen/widgets/listaboutme1_item_widget.dart';
import '../course_details_two_screen/widgets/listaboutme_five1_item_widget.dart';
import '../course_details_two_screen/widgets/listaboutme_two1_item_widget.dart';
import 'package:flutter/material.dart';

class CourseDetailsTwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Container(
          margin: EdgeInsets.only(
                               ).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: ScreenUtil().setHeight(
                  325.00,
                ),
                width: ScreenUtil().screenWidth,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        ImageConstant.imgRectangle30105325X375,
                        height: ScreenUtil().setHeight(
                          325.00,
                        ),
                        width: ScreenUtil().setWidth(
                          375.00,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(
                                 
                          top: 11,
                          bottom: 11,
                        ).r,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: ScreenUtil().screenWidth,
                              margin: EdgeInsets.only(
                                 
                                left: 32,
                                right: 27,
                              ).r,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(
                                       
                                      top: 3,
                                      bottom: 3,
                                    ).r,
                                    child: Image.asset(
                                      ImageConstant.imgArrowleft,
                                      height: ScreenUtil().setHeight(
                                        14.00,
                                      ),
                                      width: ScreenUtil().setWidth(
                                        7.00,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    ImageConstant.imgShare,
                                    height: ScreenUtil().setHeight(
                                      20.00,
                                    ),
                                    width: ScreenUtil().setWidth(
                                      18.00,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                 
                                  top: 34,
                                ).r,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(
                                      0.5,
                                      -1.6867987120311787e-15,
                                    ),
                                    end: Alignment(
                                      0.5000000000000097,
                                      1.1919191804373446,
                                    ),
                                    colors: [
                                      ColorConstant.black90000,
                                      ColorConstant.black900Bf,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(
                                       
                                        left: 24,
                                        top: 20,
                                        right: 24,
                                      ).r,
                                      child: SliderTheme(
                                        data: SliderThemeData(
                                          trackShape:
                                              RoundedRectSliderTrackShape(),
                                          activeTrackColor:
                                              ColorConstant.indigoA200,
                                          inactiveTrackColor:
                                              ColorConstant.indigoA7004c,
                                          thumbColor: ColorConstant.indigoA200,
                                          thumbShape: RoundSliderThumbShape(),
                                        ),
                                        child: Slider(
                                          value: 41.896023,
                                          min: 0.0,
                                          max: 100.0,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                       
                                        left: 24,
                                        top: 8,
                                        right: 24,
                                        bottom: 45,
                                      ).r,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset(
                                            ImageConstant.imgCamera,
                                            height: ScreenUtil().setHeight(
                                              18.00,
                                            ),
                                            width: ScreenUtil().setWidth(
                                              78.00,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  top: 2,
                                                  bottom: 3,
                                                ).r,
                                                child: Text(
                                                  "1080P",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: ScreenUtil().setSp(
                                                      12,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  left: 5,
                                                ).r,
                                                child: Image.asset(
                                                  ImageConstant
                                                      .imgArrowdown18X18,
                                                  height: ScreenUtil().setHeight(
                                                    18.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    18.00,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  left: 12,
                                                ).r,
                                                child: Image.asset(
                                                   ImageConstant
                                                      .imgArrowdown18X18,
                                                  height: ScreenUtil().setHeight(
                                                    18.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    18.00,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: ScreenUtil().setHeight(
                      1300.00,
                    ),
                    width: ScreenUtil().screenWidth,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                                 
                              top: 154,
                              bottom: 154,
                            ).r,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray50,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [

                                        Container(
                                          margin: EdgeInsets.only(
                                 
                                            left: 12,
                                            top: 8,
                                            bottom: 8,
                                          ).r,
                                          decoration: BoxDecoration(
                                            color: ColorConstant.indigoA200,
                                            borderRadius: BorderRadius.circular(
                                              ScreenUtil().setWidth(
                                                24.00,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  left: 89,
                                                  top: 16,
                                                  right: 89,
                                                  bottom: 15,
                                                ).r,
                                                child: Text(
                                                  "Enroll now !",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    fontSize: ScreenUtil().setSp(
                                                      16,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.00,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.gray50,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  ScreenUtil().setWidth(
                                    30.00,
                                  ),
                                ),
                                topRight: Radius.circular(
                                  ScreenUtil().setWidth(
                                    30.00,
                                  ),
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: ScreenUtil().setWidth(
                                    263.00,
                                  ),
                                  margin: EdgeInsets.only(
                                 
                                    left: 24,
                                    top: 29,
                                    right: 24,
                                  ).r,
                                  child: Text(
                                    "Illustration: Find your\nArt Style",
                                    maxLines: null,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                       
                                      fontSize: ScreenUtil().setSp(
                                        24,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.36,
                                      height: 1.33,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:  EdgeInsets.only(
                                       
                                      left: 24,
                                      top: 12,
                                      right: 24,
                                    ).r,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                       
                                            top: 3,
                                            bottom: 3,
                                          ).r,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  ScreenUtil().setWidth(
                                                    20.00,
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  ImageConstant
                                                      .imgImage40X40,
                                                  height: ScreenUtil().setHeight(
                                                    40.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    40.00,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                 
                                                  left: 9,
                                                  top: 5,
                                                  bottom: 3,
                                                ).r,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Larissa Raphael",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          14,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.only(
                                       
                                                        top: 2,
                                                        right: 10,
                                                      ).r,
                                                      child: Text(
                                                        "Illustrator",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color: ColorConstant
                                                              .bluegray500,
                                                          fontSize: ScreenUtil().setSp(
                                                            12,
                                                          ),
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                 
                                            top: 4,
                                            bottom: 3,
                                          ).r,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "50.00",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .indigoA200,
                                                    fontSize: ScreenUtil().setSp(
                                                      16,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  left: 9,
                                                  top: 7,
                                                ).r,
                                                child: Text(
                                                  " 55.00",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .bluegray500,
                                                    fontSize: ScreenUtil().setSp(
                                                      14,
                                                    ),
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.00,
                                                    decoration: TextDecoration
                                                        .lineThrough,
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
                                Padding(
                                  padding:  EdgeInsets.only(
                                       
                                    left: 24,
                                    top: 12,
                                    right: 24,
                                  ).r,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(
                                       
                                          left: 1,
                                          top: 4,
                                          bottom: 4,
                                        ).r,
                                        child: Image.asset(
                                          ImageConstant.imgStar,
                                          height: ScreenUtil().setHeight(
                                            12.00,
                                          ),
                                          width: ScreenUtil().setWidth(
                                            13.00,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                       
                                          left: 5,
                                          top: 3,
                                          bottom: 4,
                                        ).r,
                                        child: Text(
                                          "5.0",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                             
                                            fontSize: ScreenUtil().setSp(
                                              14,
                                            ),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 1.00,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                       
                                          left: 13,
                                          top: 4,
                                          bottom: 4,
                                        ).r,
                                        child: Image.asset(
                                          ImageConstant.imgPlay,
                                          height: ScreenUtil().setHeight(
                                            13.00,
                                          ),
                                          width: ScreenUtil().setWidth(
                                            13.00,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                       
                                          left: 5,
                                          top: 3,
                                          bottom: 4,
                                        ).r,
                                        child: Text(
                                          "12 Lessons",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                             
                                            fontSize: ScreenUtil().setSp(
                                              14,
                                            ),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 1.00,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                       
                                          left: 13,
                                          top: 5,
                                          bottom: 5,
                                        ).r,
                                        child: Image.asset(
                                          ImageConstant.img2friends,
                                          height: ScreenUtil().setHeight(
                                            12.00,
                                          ),
                                          width: ScreenUtil().setWidth(
                                            13.00,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(
                                       
                                          left: 5,
                                          top: 3,
                                          bottom: 4,
                                        ).r,
                                        child: Text(
                                          "49.091 students",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                             
                                            fontSize: ScreenUtil().setSp(
                                              14,
                                            ),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 1.00,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                 
                                      left: 24,
                                      top: 21,
                                      right: 24,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray100,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          22.00,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                 
                                            top: 14,
                                            bottom: 15,
                                          ).r,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              ScreenUtil().setWidth(
                                                7.00,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "About",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .bluegray900,
                                                    fontSize: ScreenUtil().setSp(
                                                      14,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(

                                            left: 32,
                                            top: 5,
                                            bottom: 5,
                                          ).r,
                                          child: TextButton(
                                            onPressed: () {  }, child: Text("Content"),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                 
                                            left: 25,
                                            top: 14,
                                            bottom: 15,
                                          ).r,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              ScreenUtil().setWidth(
                                                7.00,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Reviews",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: ColorConstant
                                                        .bluegray900,
                                                    fontSize: ScreenUtil().setSp(
                                                      14,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.00,
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
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                 
                                      left: 24,
                                      top: 24,
                                      right: 24,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray50,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          16.00,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.black9001e,
                                          spreadRadius: ScreenUtil().setWidth(
                                            2.00,
                                          ),
                                          blurRadius: ScreenUtil().setWidth(
                                            2.00,
                                          ),
                                          offset: Offset(
                                            0,
                                            10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                       
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                          ).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding:  EdgeInsets.only(
                                       
                                                      left: 5,
                                                      top: 5,
                                                      right: 5,
                                                      bottom: 6,
                                                    ).r,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.cyan200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        ScreenUtil().setWidth(
                                                          12.00,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "D1",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          12,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(
                                       
                                                      left: 8,
                                                      top: 3,
                                                      bottom: 4,
                                                    ).r,
                                                    child: Text(
                                                      "Introduction",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          16,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  top: 9,
                                                  bottom: 9,
                                                ).r,
                                                child: Image.asset(
                                                  ImageConstant
                                                      .imgArrowupIndigoA200,
                                                  height: ScreenUtil().setHeight(
                                                    4.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    9.00,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(
                                       
                                            16
                                          ).w,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 2,
                                            itemBuilder: (context, index) {
                                              return Listaboutme1ItemWidget();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                 
                                      left: 24,
                                      top: 24,
                                      right: 24,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray50,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          16.00,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.black9001e,
                                          spreadRadius: ScreenUtil().setWidth(
                                            2.00,
                                          ),
                                          blurRadius: ScreenUtil().setWidth(
                                            2.00,
                                          ),
                                          offset: Offset(
                                            0,
                                            10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                       
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                          ).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    padding:  EdgeInsets.only(
                                       
                                                      left: 4,
                                                      top: 5,
                                                      right: 4,
                                                      bottom: 6,
                                                    ).r,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.cyan200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        ScreenUtil().setWidth(
                                                          12.00,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "D2",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          12,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(
                                       
                                                      left: 8,
                                                      top: 3,
                                                      bottom: 4,
                                                    ).r,
                                                    child: Text(
                                                      "Tools for a Creator",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          16,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  top: 9,
                                                  bottom: 9,
                                                ),
                                                child: Image.asset(
                                                  ImageConstant
                                                      .imgArrowupIndigoA200,
                                                  height: ScreenUtil().setHeight(
                                                    4.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    9.00,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(
                                       
                                             16
                                          ).w,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 3,
                                            itemBuilder: (context, index) {
                                              return ListaboutmeTwo1ItemWidget();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                 
                                      left: 24,
                                      top: 24,
                                      right: 24,
                                    ).r,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray50,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          16.00,
                                        ),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorConstant.black9001e,
                                          spreadRadius: ScreenUtil().setWidth(
                                            2.00,
                                          ),
                                          blurRadius: ScreenUtil().setWidth(
                                            2.00,
                                          ),
                                          offset: Offset(
                                            0,
                                            10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(
                                       
                                            left: 16,
                                            top: 16,
                                            right: 16,
                                          ).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    padding:  EdgeInsets.only(
                                       
                                                      left: 5,
                                                      top: 5,
                                                      right: 5,
                                                      bottom: 6,
                                                    ).r,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          ColorConstant.cyan200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        ScreenUtil().setWidth(
                                                          12.00,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "D1",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          12,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(
                                       
                                                      left: 8,
                                                      top: 5,
                                                    ).r,
                                                    child: Text(
                                                      "Final Project",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorConstant
                                                            .bluegray900,
                                                        fontSize: ScreenUtil().setSp(
                                                          16,
                                                        ),
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:  EdgeInsets.only(
                                       
                                                  top: 9,
                                                  bottom: 9,
                                                ).r,
                                                child: Image.asset(
                                                  ImageConstant
                                                      .imgArrowupIndigoA200,
                                                  height: ScreenUtil().setHeight(
                                                    4.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    9.00,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(
                                       
                                            16,
                                          ).w,
                                          child: ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 2,
                                            itemBuilder: (context, index) {
                                              return ListaboutmeFive1ItemWidget();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                 
                                    top: 26,
                                    bottom: 13,
                                  ).r,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Padding(
                                        padding: EdgeInsets.only(

                                          left: 12,
                                          top: 8,
                                          bottom: 8,
                                        ).r,
                                        child: TextButton(
                                          onPressed: () {  }, child: Text("Enroll now !"),

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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
