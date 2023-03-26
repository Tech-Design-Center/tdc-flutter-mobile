import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/course_details_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class Listitem4ItemWidget extends StatefulWidget {

  Listitem4ItemWidget();

  @override
  State<Listitem4ItemWidget> createState() => _Listitem4ItemWidgetState();
}

class _Listitem4ItemWidgetState extends State<Listitem4ItemWidget> {

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topCenter,
      child: InkWell(
        onTap:  (){
          Get.to(CourseDetailsScreen(isEnrolled: true,url: 'https://firebasestorage.googleapis.com/v0/b/techdesigncenter-84455.appspot.com/o/1.mp4?alt=media&token=7986dc33-0148-4921-9ef5-bd387797c043',)
          );
                  },
        child: Container(
          margin: EdgeInsets.only(

            top: 12.0,
            bottom: 12.0,
          ).r,
          height: ScreenUtil().setHeight(200),
          decoration: BoxDecoration(
            border: Border.all(width: 0.8, color: Colors.grey),
            color: ColorConstant.gray50,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(
                60.00,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.bluegray90011,
                spreadRadius: ScreenUtil().setWidth(
                  2.00,
                ),
                blurRadius: ScreenUtil().setWidth(
                  2.00,
                ),
                offset: Offset(
                  3,
                  3,
                ),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:  EdgeInsets.only(

                  left: 50,
                  top: 16,
                  bottom: 16,
                ).r,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        color: ColorConstant.cyan200,
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(
                            12.00,
                          ),
                        ),
                      ),
                      child: Text(
                        "1",
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
                    Padding(
                      padding:  EdgeInsets.only(

                        left: 50,
                        top: 3,
                        bottom: 4,
                      ).r,
                      child: Text(
                        "Introduction",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(

                          fontSize: ScreenUtil().setSp(
                            60,
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
              Spacer(),
              Padding(
                padding:  EdgeInsets.only(

                  left: 153,
                  top: 25,
                  right: 60,
                  bottom: 25,
                ).r,
                child: Icon(Icons.play_arrow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
