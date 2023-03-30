import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/local_data/coursesList.dart';

import 'package:flutter/material.dart';
import 'widgets/my_course_card.dart';

class MyCourseListScreen extends StatelessWidget {
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  top: 0,
                  right: 24,
                  bottom: 3,
                ).r,
                child: Text(
                  "My learning",
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
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 80,
                  top: 50,
                  right: 50,
                ).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 1,
                      ).r,
                      child: Text(
                        "My Courses",
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  top: 35,
                  right: 24,
                ).r,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return MyCourseCard();
                  },
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(200),
              )
            ],
          ),
        ),
      ))
    ])));
  }
}
