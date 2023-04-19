import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
        ).r,
        child: Padding(
          padding: EdgeInsets.only(left: 90, right: 8).r,
          child: Container(
            height: ScreenUtil().setHeight(450),
            child: ListView.separated(
              separatorBuilder: ((context, index) => SizedBox(
                    width: 30,
                  )),
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 40, left: 20, right: 20).r,
              itemBuilder: (context, index) {
                return Container(
                  width: ScreenUtil().setWidth(200),
                  child: Column(
                    children: [
                      Image.asset(
                        ImageConstant.category1,
                        width: ScreenUtil().setWidth(800),
                        height: ScreenUtil().setHeight(200),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20).r,
                          child: Container(
                            width: 200.w,
                            height: 50.h,
                            decoration: BoxDecoration(color: Colors.black),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
