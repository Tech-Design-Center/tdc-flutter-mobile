import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/coursesList.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';

import '../recommend_screen/widgets/recommend_item_widget.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class RecommendScreen extends StatelessWidget {
  TextEditingController searchbarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left:120).r,
              height: ScreenUtil().setHeight(300),
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(

                        left: 310,
                        top: 0,
                        right: 24,
                        bottom: 3,
                      ).r,
                      child: Text(
                        "Recommend",
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
                               
                              left: 24,
                              top: 16,
                              right: 24,
                            ).r,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: EdgeInsets.only(
                                     
                                    top: 24,
                                  ).r,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: coursesList.length,
                                      itemBuilder: (context, index) {
                                        return RecommendItemWidget(
                                            index: index);
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
