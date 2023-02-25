import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';


// ignore: must_be_immutable
class Listitem10ItemWidget extends StatelessWidget {
  Listitem10ItemWidget();

  @override
  Widget build(BuildContext context) {
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: (){
            /*
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>InstructorsCoursesScreen()),
  );
          */
            },
          child: Container(
            margin: EdgeInsets.only(

              right: 0,
            ).r,
            decoration: BoxDecoration(
              color:ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(
                  24.00,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color:isDark?Colors.transparent: ColorConstant.black9001e,
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
                          20.00,
                        ),
                      ),
                      child: Image(
                        image: AssetImage(ImageConstant.instructor1,),
                        height: ScreenUtil().setHeight(600),
                        width: ScreenUtil().setWidth(600),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(

                    left: 16,
                    top: 15,
                    right: 16,
                  ).r,
                  child: Text(
                    "Daniel Wallet",
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
                ),
                Padding(
                  padding:  EdgeInsets.only(

                    left: 16,
                    top: 13,
                    right: 16,
                  ).r,
                  child: Text(
                    "Illustrator, Artist",
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
                    padding:   EdgeInsets.only(

                      left: 16,
                      top: 7,
                      right: 16,
                      bottom: 16,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:   EdgeInsets.only(

                            left: 1,
                            top: 4,
                            bottom: 4,
                          ).r,
                          child: Image(
                            image: AssetImage(ImageConstant.imgStar,),
                            height: ScreenUtil().setHeight(600),
                            width: ScreenUtil().setWidth(600),
                          ),
                        ),
                        20.horizontalSpace,
                        Padding(
                          padding:   EdgeInsets.only(

                            left: 0,
                            top: 3,
                            bottom: 4,
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
                              
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(

                            left: 15,
                            top: 4,
                            bottom: 4,
                          ).r,
                          child: Image(
                            image: AssetImage(ImageConstant.imgUser,),
                            height: ScreenUtil().setHeight(600),
                            width: ScreenUtil().setWidth(600),
                          ),
                        ),
                        20.horizontalSpace,
                        Padding(
                          padding:  EdgeInsets.only(

                            left: 0,
                            top: 3,
                            bottom: 4,
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
      ),
    );
  }
}
