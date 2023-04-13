import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/home/course_details_screen.dart';

import '../../../../model/course.dart';

// ignore: must_be_immutable
class MyCourseCard extends StatelessWidget {
  final Course course;
  MyCourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CourseDetailsScreen(
          about: course.about,
          author: course.author,
          description: course.description,
          duration: course.duration,
          image: course.image,
          isEnroll: course.isEnroll,
          playlistTitle: course.playlistTitle,
          price: course.price,
          title: course.title,
          videoTitle: course.videoTitle,
          videoTrailerURL: course.videoTrailerURL,
          videoUrl: course.videoUrl,
        ));
      },
      child: Container(
        height: ScreenUtil().setHeight(600),
        margin: EdgeInsets.only(
          left: 50,
          right: 50,
          top: 12.0,
          bottom: 12.0,
        ).r,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 16,
                bottom: 16,
              ).r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(
                    12.00,
                  ),
                ),
                child: Image.network(
                  course.image,
                  height: ScreenUtil().setHeight(
                    400.00,
                  ),
                  width: ScreenUtil().setWidth(
                    400.00,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 12,
                top: 21,
                right: 25,
                bottom: 19,
              ).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: ScreenUtil().setWidth(
                      800.00,
                    ),
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 8,
                    ).r,
                    child: Text(
                      course.title,
                      maxLines: null,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(
                          60,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 1.57,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ).r,
                    child: Text(
                      "Teach by : ${course.author}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.bluegray500,
                        fontSize: ScreenUtil().setSp(
                          50,
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
    );
  }
}
