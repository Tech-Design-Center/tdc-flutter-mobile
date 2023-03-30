import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/notifications_screen/notifications_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotificationDetailScreen> createState() => _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(name: 'Notification', widget: NotificationsScreen(),),

            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [


                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(

                              left: 50,
                              top: 50,
                              right: 50,
                            ).r,

                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding:  EdgeInsets.only(

                                    top: 16,
                                  ).r,
                                  child: Container(
                                    height: ScreenUtil().setHeight(2000),
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
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(

                                                left: 35,
                                                top: 13,
                                                bottom: 13,
                                                right: 15,
                                              ).r,
                                              child: ClipRRect(

                                                child: Image.asset(
                                                  ImageConstant.imgRectangle792,
                                                  height: ScreenUtil().setHeight(
                                                    400.00,
                                                  ),
                                                  width: ScreenUtil().setWidth(
                                                    350.00,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: ScreenUtil().setWidth(800),
                                              margin: EdgeInsets.only(

                                                left: 30,
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
                                                        bottom: 5,
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

                                                      top: 0,
                                                      right: 10,
                                                    ).r,
                                                    child: Text(
                                                      "Register New Class in May 2023 and get 25% discount !",
                                                      overflow: TextOverflow.fade,

                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(

                                                        fontSize: ScreenUtil().setSp(
                                                          40,
                                                        ),

                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400,
                                                        height: 5.h,
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
                                                        fontWeight: FontWeight.w400,
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
                                        Divider(color: Colors.black,height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset("assets/images/poster.jpg"),
                                        ),
                                      ],
                                    ),
                                  )
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
            ),


          ],
        ),
      ),
    );
  }
}
