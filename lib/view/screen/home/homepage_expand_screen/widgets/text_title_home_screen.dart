import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/color_constant.dart';

class textTitleHomeScreen extends StatelessWidget {
  String name;
  Widget screen;
  textTitleHomeScreen({super.key, required this.name, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                65,
              ),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 1.00,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => screen);
            },
            child: Text(
              "See all".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ColorConstant.indigoA200,
                fontSize: ScreenUtil().setSp(
                  60,
                ),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.00,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
