import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/base_url.dart';
import 'package:tdc_frontend_mobile/view/screen/home/course_details_screen.dart';

import '../../../../core/constants/color_constant.dart';
import '../../../../model/popular.dart';

class PopularsCard extends StatelessWidget {
  final Popular popular;

  const PopularsCard({required this.popular});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CourseDetailsScreen(
          author: popular.author,
          description: popular.description,
          duration: popular.duration,
          image: popular.image,
          isEnroll: false,
          playlistTitle: popular.playlistTitle,
          price: popular.price,
          title: popular.title,
          videoTitle: popular.videoTitle,
          videoTrailerURL: popular.videoTrailerURL,
          videoUrl: popular.videoUrl,
          ABAPaymentURL: popular.ABAPaymentURL,
          documentsURL: popular.documentURL,
          purchaseDate: DateTime(2023,1,1), telegramURL: '',

        ));
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                top: 12,
                bottom: 12,
              ).r,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: Image.network(
                            popular.image!,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      top: 16,
                      bottom: 17,
                    ).r,
                    child: Text(
                      popular.title!,
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
  }
}
