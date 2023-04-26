import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends StatelessWidget {
  ProfileItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.gray50,
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(
              16.00,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.black9001e,
              spreadRadius: ScreenUtil().setWidth(
                2.00,
              ),
              blurRadius: ScreenUtil().setWidth(
                2.00,
              ),
              offset: Offset(
                0,
                10,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:  REdgeInsets.only(
                                       
                  left: 12,
                  top: 12,
                  right: 12,
                ) ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(
                      12.00,
                    ),
                  ),
                  child: Image(
                    image: AssetImage(ImageConstant.imgPhoto88X96,),
                    height: ScreenUtil().setHeight(200),
                    width: ScreenUtil().setWidth(200),
                  ),
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(
                110.00,
              ),
              margin: REdgeInsets.only(
                                 
                left: 12,
                top: 17,
                right: 12,
              ) ,
              child: Text(
                "Illustration: Find your Art Style",
                maxLines: null,
                textAlign: TextAlign.start,
                style: TextStyle(
                   
                  fontSize: ScreenUtil().setSp(
                    14,
                  ),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1.57,
                ),
              ),
            ),
            Padding(
              padding:  REdgeInsets.only(
                                       
                left: 12,
                top: 5,
                right: 12,
                bottom: 13,
              ) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:  REdgeInsets.only(
                                       
                      left: 2,
                      top: 2,
                      bottom: 2,
                    ) ,
                    child: Image(
                      image: AssetImage(ImageConstant.imgThumbsup,),
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(200),
                    ),
                  ),
                  Padding(
                    padding:  REdgeInsets.only(
                                       
                      left: 6,
                      top: 1,
                      bottom: 2,
                    ) ,
                    child: Text(
                      "1.000",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.bluegray700,
                        fontSize: ScreenUtil().setSp(
                          12,
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
