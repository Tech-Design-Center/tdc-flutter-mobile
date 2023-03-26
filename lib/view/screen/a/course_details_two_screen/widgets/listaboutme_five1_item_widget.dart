import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

// ignore: must_be_immutable
class ListaboutmeFive1ItemWidget extends StatelessWidget {
  ListaboutmeFive1ItemWidget();

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
                                 
        top: 8.0,
        bottom: 8.0,
      ).r,
      decoration: BoxDecoration(
        color: ColorConstant.blue50,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(
            16.00,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding:  EdgeInsets.only(
                                       
              left: 12,
              top: 12,
              bottom: 12,
            ).r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(
                      12.00,
                    ),
                  ),
                  child: Image.asset(
                      ImageConstant.imgRectangle792,
                    height: ScreenUtil().setHeight(
                      60.00,
                    ),
                    width: ScreenUtil().setWidth(
                      60.00,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                                 
                    left: 12,
                    top: 11,
                    bottom: 11,
                  ).r,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Last exercise",
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
                      Padding(
                        padding:  EdgeInsets.only(
                                       
                          top: 10,
                          right: 10,
                        ).r,
                        child: Text(
                          "05:05 mins",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorConstant.bluegray500,
                            fontSize: ScreenUtil().setSp(
                              12,
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
          Container(
            height: ScreenUtil().setHeight(
              48.00,
            ),
            width: ScreenUtil().setWidth(
              48.00,
            ),
            margin: EdgeInsets.only(
                                 
              left: 63,
              top: 18,
              right: 12,
              bottom: 18,
            ).r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: ScreenUtil().setHeight(
                      48.00,
                    ),
                    width: ScreenUtil().setWidth(
                      48.00,
                    ),
                    child: CircularProgressIndicator(
                      value: 0.5,
                      backgroundColor: ColorConstant.blue100,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstant.blue51,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: ScreenUtil().setHeight(
                      40.00,
                    ),
                    width: ScreenUtil().setWidth(
                      40.00,
                    ),
                    margin: EdgeInsets.all(
                      4,
                    ).w,
                    decoration: BoxDecoration(
                      color: ColorConstant.blue50,
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(
                          20.00,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: ScreenUtil().setHeight(
                      48.00,
                    ),
                    width: ScreenUtil().setWidth(
                      48.00,
                    ),
                    child: CircularProgressIndicator(
                      value: 0.5,
                      backgroundColor: ColorConstant.gray50,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorConstant.blue51,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:  EdgeInsets.only(
                                       
                      left: 17,
                      top: 16,
                      right: 16,
                      bottom: 16,
                    ).r,
                    child: Image.asset(
                        ImageConstant.imgLock,
                      height: ScreenUtil().setHeight(
                        16.00,
                      ),
                      width: ScreenUtil().setWidth(
                        14.00,
                      ),
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
