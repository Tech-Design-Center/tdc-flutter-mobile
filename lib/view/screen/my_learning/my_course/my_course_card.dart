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
  const MyCourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: course.title!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(CourseDetailsScreen(
              author: course.author![index],
              description: course.description![index],
              duration: course.duration![index],
              image: course.image![index],
              isEnroll: true,
              playlistTitle: course.playlistTitle![index],
              price: course.price![index],
              title: course.title![index],
              videoTitle: course.videoTitle![index],
              videoTrailerURL: course.videoTrailerURL![index],
              videoUrl: course.videoUrl![index],
              ABAPaymentURL: course.ABAPaymentURL![index],
              documentsURL: course.documentURL![index],
              purchaseDate: course.purchaseDate![index],
              telegramURL: course.telegramURL![index],


            ));
          },
          child: Container(
            height: ScreenUtil().setHeight(600),
            margin: REdgeInsets.only(
              left: 50,
              right: 50,
              top: 12.0,
              bottom: 12.0,
            ),
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
                  padding: REdgeInsets.only(
                    left: 16,
                    top: 16,
                    bottom: 16,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(
                        12.00,
                      ),
                    ),
                    child: Image.network(
                      course.image![index],
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
                  margin: REdgeInsets.only(
                    left: 12,
                    top: 21,
                    right: 25,
                    bottom: 19,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(
                          800.00,
                        ),
                        margin: REdgeInsets.only(
                          left: 20,
                          right: 8,
                        ),
                        child: Text(
                          course.title![index],
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
                        padding: REdgeInsets.only(
                          left: 20,
                          top: 20,
                        ),
                        child: Text(
                          "Teach by : ".tr +"${course.author![index]}",
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
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 30.h,
        );
      },
    );
  }
}
