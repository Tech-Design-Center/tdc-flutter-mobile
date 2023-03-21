import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SectionTitleScreen extends StatelessWidget {
  final String name;
  const SectionTitleScreen({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 120).r,
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
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 360,
                top: 0,
                right: 24,
                bottom: 3,
              ).r,
              child: Text(
                name,
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
    );
  }
}
