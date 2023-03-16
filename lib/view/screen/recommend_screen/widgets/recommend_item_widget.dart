import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/constants.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/coursesList.dart';

// ignore: must_be_immutable
class RecommendItemWidget extends StatelessWidget {
  int index;
  RecommendItemWidget({
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
               /* onTap: (){
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context)
           =>CourseDetailsScreen(isEnrolled: false,)),
            );
                  },*/
      child: Container(
        width: ScreenUtil().screenWidth,
        margin: EdgeInsets.only(

          top: 12.0,
          bottom: 12.0,
        ).r,
        decoration: BoxDecoration(
          color:ColorConstant.gray50,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(
              16.00,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color:ColorConstant.black9001e,
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
              padding:  EdgeInsets.only(
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
                child: Image.asset(
                  coursesList[index].image,
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
                left: 50,
                top: 22,
                right: 16,
                bottom: 19,
              ).r,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(

                      right: 10,
                    ).r,
                    child: Text(
                      "Microsoft Office 2019",
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

                  Padding(
                    padding:  EdgeInsets.only(

                      top: 40,
                      right: 10,
                    ).r,
                    child: Text(
                      "Teach by : Mekmun Sopheaktra",
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.bluegray500,
                        fontSize: ScreenUtil().setSp(
                          50,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 5.h,
                      ),
                    ),
                  ),


                  Padding(
                    padding:  EdgeInsets.only(

                      top: 60,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(
                            left: 14,
                            top: 15,
                            bottom: 4,
                          ).r,
                          child: Icon(Icons.video_collection,color: Colors.grey,)
                        ),
                        Padding(
                          padding:  EdgeInsets.only(

                            left: 10,
                            top: 15,
                            bottom: 4,
                          ).r,
                          child: Text(
                            "10 ",
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

                            left: 10,
                            top: 15,
                            bottom: 4,
                          ).r,
                          child: Text(
                            "Videos ",
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

                            left: 300,
                            top: 15,
                            bottom: 2,
                          ).r,
                          child: Text(
                            "${Constants.currency} 30",
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorConstant.indigoA200,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
