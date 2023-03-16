import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/notification_detail_screen/notification_detail_screen.dart';


// ignore: must_be_immutable
class ListsketchingtranItemWidget extends StatelessWidget {
  ListsketchingtranItemWidget();

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NotificationDetailScreen()),
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(400),
        margin: EdgeInsets.only(

          top: 8.0,
          bottom: 8.0,
        ).r,
        decoration: BoxDecoration(
          color:ColorConstant.whiteA700,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:  EdgeInsets.only(

                left: 12,
                top: 13,
                bottom: 13,
              ).r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(
                    80.00,
                  ),
                ),
                child: Image.asset(
                  ImageConstant.imgRectangle792,
                  height: ScreenUtil().setHeight(
                    500.00,
                  ),
                  width: ScreenUtil().setWidth(
                    350.00,
                  ),
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(900),
              margin: EdgeInsets.only(

                left: 12,
                top: 40,
                bottom: 12,
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

                        top: 3,
                        right: 5,
                      ).r,
                      child: Text(
                        "New Class Basic Microsoft Office Start in Next Week!",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: TextStyle(

                          fontSize: ScreenUtil().setSp(
                            60,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 5.h,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(

                      top: 15,
                      right: 10,
                    ).r,
                    child: Text(
                      "Register New Class in May 2023 and get 25% discount !",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(

                        fontSize: ScreenUtil().setSp(
                          40,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.00,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(

                      top: 25,
                      right: 10,
                    ).r,
                    child: Text(
                      "20 mins ago",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: ColorConstant.bluegray500,
                        fontSize: ScreenUtil().setSp(
                          40,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        height: 1.00,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(
                8.00,
              ),
              width: ScreenUtil().setWidth(
                8.00,
              ),
              margin: EdgeInsets.only(

                left: 12,
                top: 12,
                right: 12,
                bottom: 66,
              ).r,
              decoration: BoxDecoration(
                color: ColorConstant.indigoA200,
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(
                    4.00,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
