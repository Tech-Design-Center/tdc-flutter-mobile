import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';

import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/model/course.dart';
import '../../../../controller/controllers.dart';
import 'my_course_card.dart';
import 'my_course_list_view.dart';

class MyCourseScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Container(
        height: ScreenUtil().setHeight(300),
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "My learning".tr,
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
          ],
        ),
      ),
      Expanded(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.only(
                  left: 80,
                  top: 50,
                  right: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'My Courses'.tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(
                          70,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.00,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (myCourseController.courseList.isNotEmpty) {
                  return MyCourseListView(course: myCourseController.courseList);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
            ],
          ),
        ),
      ))
    ])));
  }
}
