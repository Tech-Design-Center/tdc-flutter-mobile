import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/category_list.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/course_screen/course_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/notifications_screen/widgets/listsketchingtran_item_widget.dart';

class RecommendsLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 120).r,
                height: ScreenUtil().setHeight(300),
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 310,
                          top: 0,
                          right: 24,
                          bottom: 3,
                        ).r,
                        child: Text(
                          "Categories",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(
                              100,
                            ),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.36,
                            height: 1.00,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListView.separated(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 24, bottom: 24)
                                .r,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 60.h);
                            },
                            itemCount: categoryList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => CourseScreen());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700,
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        16.00,
                                      ),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorConstant.black9001e,
                                        spreadRadius: ScreenUtil().setWidth(
                                          0.00,
                                        ),
                                        blurRadius: ScreenUtil().setWidth(
                                          10.00,
                                        ),
                                        offset: Offset(
                                          0,
                                          4,
                                        ),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 12,
                                          top: 12,
                                          bottom: 12,
                                        ).r,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: ScreenUtil().setHeight(
                                                300.00,
                                              ),
                                              width: ScreenUtil().setWidth(
                                                250.00,
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                    10,
                                                  ).w,
                                                  child: Image.asset(
                                                    '',
                                                    height:
                                                        ScreenUtil().setHeight(
                                                      250.00,
                                                    ),
                                                    width:
                                                        ScreenUtil().setWidth(
                                                      250.00,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                                top: 16,
                                                bottom: 17,
                                              ).r,
                                              child: Text(
                                                'loading',
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(
                                                    60,
                                                  ),
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            top: 31,
                                            right: 17,
                                            bottom: 31,
                                          ).r,
                                          child: Icon(Icons.arrow_forward_ios)),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
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
