import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_frontend_mobile/model/popular.dart';
import 'package:tdc_frontend_mobile/view/screen/home/course_details_screen.dart';

import '../../../../../../core/constants/color_constant.dart';
import '../../../../../../core/constants/image_constant.dart';
import '../../../../../../model/recommend.dart';

class RecommendCard extends StatelessWidget {
  final Recommend recommend;
  RecommendCard({
    required this.recommend,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onTap: () {
          Get.to(CourseDetailsScreen(
            author: recommend.author,
            description: recommend.description,
            duration: recommend.duration,
            image: recommend.image,
            isEnroll: false,
            playlistTitle: recommend.playlistTitle,
            price: recommend.price,
            title: recommend.title,
            videoTitle: recommend.videoTitle,
            videoTrailerURL: recommend.videoTrailerURL,
            videoUrl: recommend.videoUrl,
            ABAPaymentURL: recommend.ABAPaymentURL,
            documentsURL: recommend.documentURL,
            purchaseDate: DateTime(2023,1,1), telegramURL: '',
          ));
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: ScreenUtil().setWidth(850),
            height: ScreenUtil().setHeight(1400),
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(
                  25.00,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 16,
                      right: 16,
                    ).r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(
                          5.00,
                        ),
                      ),
                      child: Image(
                        image: NetworkImage(recommend.image!),
                        height: ScreenUtil().setHeight(600),
                        width: ScreenUtil().setWidth(1400),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 16,
                    top: 17,
                    right: 16,
                  ).r,
                  child: Text(
                    recommend.title!,
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
                    left: 16,
                    top: 13,
                    right: 16,
                  ).r,
                  child: Text(
                    recommend.author!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.bluegray500,
                      fontSize: ScreenUtil().setSp(
                        45,
                      ),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 4.h,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 5,
                      right: 16,
                      bottom: 16,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                            top: 50,
                            bottom: 1,
                          ).r,
                          child: InkWell(
                            onTap: () {
                              // Get.to(CourseDetailsScreen(
                              //   isEnrolled: true,
                              //   initURL: 'https://youtu.be/A3ltMaM6noM',
                              //   recommend: recommend,
                              // ));
                            },
                            child: Container(
                                width: ScreenUtil().setWidth(800),
                                height: ScreenUtil().setHeight(120),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(50)).w,
                                  color: Colors.grey.shade300,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("View".tr),
                                  ],
                                )),
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
    );
  }
}
