import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

// ignore: must_be_immutable
class Listitem5ItemWidget extends StatelessWidget {
  Listitem5ItemWidget();

  @override
  Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(

            right: 24,
          ).r,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setWidth(
                24.00,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color:isDark?Colors.transparent: ColorConstant.black9001e,
                spreadRadius:  ScreenUtil().setWidth(
                  0.00,
                ),
                blurRadius:  ScreenUtil().setWidth(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:  EdgeInsets.only(

                    left: 16,
                    top: 16,
                    right: 16,
                  ).r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setWidth(
                        16.00,
                      ),
                    ),
                    child: SvgPicture.asset(
                      ImageConstant.imgPhoto200X326,
                      height: ScreenUtil().setHeight(
                        144.00,
                      ),
                      width: ScreenUtil().setWidth(
                        256.00,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(
                  243.00,
                ),
                margin: EdgeInsets.only(

                  left: 16,
                  top: 17,
                  right: 16,
                ).r,
                child: Text(
                  "Sketching: Transform Your Doodles into Art",
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
                padding:  EdgeInsets.only(

                  left: 16,
                  top: 13,
                  right: 16,
                ).r,
                child: Text(
                  "Mattias Adolfsson",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ColorConstant.bluegray500,
                    fontSize: ScreenUtil().setSp(
                      14,
                    ),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.00,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding:  EdgeInsets.only(

                    left: 16,
                    top: 8,
                    right: 16,
                    bottom: 16,
                  ).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(

                          left: 1,
                          top: 3,
                          bottom: 4,
                        ).r,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(

                                top: 1,
                                bottom: 1,
                              ).r,
                              child: Image(
                                image: AssetImage(ImageConstant.imgStar,),
                                height: ScreenUtil().setHeight(600),
                                width: ScreenUtil().setWidth(600),
                              ),
                            ),

                            Padding(
                              padding:  EdgeInsets.only(

                                left: 3,
                              ).r,
                              child: Text(
                                "5.0",
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
                            Padding(
                              padding:  EdgeInsets.only(

                                left: 18,
                                top: 1,
                                bottom: 1,
                              ).r,
                              child: Image(
                                image: AssetImage(ImageConstant.imgUser,),
                                height: ScreenUtil().setHeight(600),
                                width: ScreenUtil().setWidth(600),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(

                                left: 4,
                              ).r,
                              child: Text(
                                "40.000",
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
                      Padding(
                        padding:  EdgeInsets.only(

                          top: 3,
                          bottom: 2,
                        ).r,
                        child: Text(
                          "5.00",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorConstant.indigoA200,
                            fontSize: ScreenUtil().setSp(
                              16,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
