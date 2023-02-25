import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/constants.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';


// ignore: must_be_immutable
class Listitem8ItemWidget extends StatelessWidget {
  Listitem8ItemWidget();

  @override
  Widget build(BuildContext context) {

    return IntrinsicWidth(
      child: InkWell(
        onTap: (){
          /*
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>CourseDetailsScreen(isEnrolled: false,)),
  );
       */
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width:  ScreenUtil().setWidth(850),
            height: ScreenUtil().setHeight(1200),
            margin: EdgeInsets.only(

              right: 0,
            ).r,
            decoration: BoxDecoration(
              color: ColorConstant.whiteA700,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(
                  25.00,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          5.00,
                        ),
                      ),
                      child: Image(
                        image: AssetImage(ImageConstant.imgPhoto200X326,),
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
                    "Microsoft Office 2019",
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
                  padding:  EdgeInsets.only(
                                        
                    left: 16,
                    top: 13,
                    right: 16,
                  ).r,
                  child: Text(
                    "Teach by : Mekmun Sopheaktra",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConstant.bluegray500,
                      fontSize: ScreenUtil().setSp(
                        45,
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
                      top: 40,
                      right: 16,
                      bottom: 16,
                    ).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(

                            left: 18,
                            top: 20,
                            bottom: 1,
                          ).r,
                          child: Container(

                              width: ScreenUtil().setWidth(800),
                              height: ScreenUtil().setHeight(120),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)).w  ,
                                color: Colors.grey.shade300,
                              ),

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("View"),
                                ],
                              )

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
