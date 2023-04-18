import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';

class CategoriesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorConstant.whiteA700,
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
                child: Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24).r,
                    child: Column(
                      children: [
                        CategoriesLoadingCard(),
                        SizedBox(
                          height: 60.h,
                        ),
                        CategoriesLoadingCard(),
                        SizedBox(
                          height: 60.h,
                        ),
                        CategoriesLoadingCard(),
                        SizedBox(
                          height: 60.h,
                        ),
                        CategoriesLoadingCard(),
                      ],
                    ),
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

class CategoriesLoadingCard extends StatelessWidget {
  const CategoriesLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 12,
            top: 12,
            bottom: 12,
          ).r,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: ScreenUtil().setHeight(
                  300.00,
                ),
                width: ScreenUtil().setWidth(
                  250.00,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.all(
                        10,
                      ).w,
                      child: Container(
                        width: 250.w,
                        height: 250.h,
                        decoration: BoxDecoration(color: Colors.black),
                      )),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    top: 16,
                    bottom: 17,
                  ).r,
                  child: Container(
                    width: 300.w,
                    height: 100.h,
                    decoration: BoxDecoration(color: Colors.black),
                  )),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
              top: 31,
              right: 17,
              bottom: 31,
            ).r,
            child: Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
