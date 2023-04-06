import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

// ignore: must_be_immutable
class NewsFeedCardLoading extends StatelessWidget {
  NewsFeedCardLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(60),
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey.shade300,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: REdgeInsets.only(right: 30),
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
                SizedBox(
                  width: ScreenUtil().setWidth(850),
                  child: Padding(
                    padding: REdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Loading",
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
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Loading",
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
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "Loading",
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/poster.jpg"),
          ],
        ),
      ),
    );
  }
}
