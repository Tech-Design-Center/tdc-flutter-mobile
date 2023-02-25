import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../notifications_screen/widgets/listsketchingtran_item_widget.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: ScreenUtil().setHeight(300),
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(

                        left: 24,
                        top: 0,
                        right: 24,
                        bottom: 3,
                      ).r,
                      child: Text(
                        "Notification",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            100,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.36,
                          height: 1.00,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                      
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
                                      
                                    right: 10,
                                  ).r,
                                  child: Text(
                                    "All",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                       
                                      fontSize: ScreenUtil().setSp(
                                        70,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      
                                    top: 16,
                                  ).r,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return ListsketchingtranItemWidget();
                                    },
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
            ),
          
         
          ],
        ),
      ),
    );
  }
}
