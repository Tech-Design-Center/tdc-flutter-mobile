import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/color_constant.dart';
import '../../../../core/constants/image_constant.dart';

class SectionSettingCard extends StatelessWidget {
  final String name;
  final String screen;
  SectionSettingCard(
      {Key? key, required, required this.name, required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => screen);
            },
            child: Container(
              height: ScreenUtil().setHeight(220),
              width: ScreenUtil().setWidth(1130),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.settings,
                          width: ScreenUtil().setWidth(100),
                          height: ScreenUtil().setHeight(100),
                        ),
                        20.horizontalSpace,
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: ScreenUtil().setSp(60),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstant.indigoA200,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
