import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

// ignore: must_be_immutable
class CourseDetailsItemWidget extends StatelessWidget {
  CourseDetailsItemWidget();

  @override
  Widget build(BuildContext context) {
  
    return IntrinsicWidth(
      child: Container(
        margin: EdgeInsets.only(
                                 
          right: 32,
        ).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:  EdgeInsets.only(
                                       
                  left: 1,
                  top: 5,
                ).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(
                                       
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
                        top: 1,
                      ).r,
                      child: Text(
                        "Beginner",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                           
                          fontSize: ScreenUtil().setSp(
                            14,
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
            ),
            Padding(
              padding:  EdgeInsets.only(
                                       
                left: 2,
                top: 12,
                right: 10,
              ).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(
                                       
                      bottom: 4,
                    ).r,
                    child: Image.asset(
                        ImageConstant.imgMicrophone,
                      height: ScreenUtil().setHeight(
                        13.00,
                      ),
                      width: ScreenUtil().setWidth(
                        11.00,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                                       
                      left: 6,
                      top: 1,
                    ).r,
                    child: Text(
                      "English",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                         
                        fontSize: ScreenUtil().setSp(
                          14,
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
          ],
        ),
      ),
    );
  }
}
