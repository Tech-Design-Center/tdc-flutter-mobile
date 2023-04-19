import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

// ignore: must_be_immutable
class EnrollCourseItemWidget extends StatelessWidget {
  EnrollCourseItemWidget();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
         
        top: 14.0,
        bottom: 14.0,
      ).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(
               
              left: 2,
              top: 12,
              bottom: 12,
            ).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(
                  10.00,
                ),
              ),
              border: Border.all(
                color: ColorConstant.indigoA200,
                width: ScreenUtil().setWidth(
                  2.00,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: ScreenUtil().setHeight(
                    10.00,
                  ),
                  width: ScreenUtil().setWidth(
                    10.00,
                  ),
                  margin: EdgeInsets.all(
                     
                    5,
                  ).w,
                  decoration: BoxDecoration(
                    color: ColorConstant.indigoA200,
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(
                        5.00,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
               
              left: 18,
              top: 2,
              bottom: 2,
            ).r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(
                  8.00,
                ),
              ),
              child: Image.asset(
                ImageConstant.imgPhoto40X64,
                height: ScreenUtil().setHeight(
                  40.00,
                ),
                width: ScreenUtil().setWidth(
                  64.00,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
               
              left: 16,
              top: 3,
              right: 80,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "**** **** **** 2823",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(
                      14,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 1.00,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                     
                    top: 9,
                    right: 10,
                  ).r,
                  child: Text(
                    "Duong Khanh",
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
        ],
      ),
    );
  }
}
