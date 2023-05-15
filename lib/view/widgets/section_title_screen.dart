import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SectionTitleScreen extends StatelessWidget {
  final String? name;
  const SectionTitleScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: Offset(0, 10), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],

      ),
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().screenWidth,

      child: Padding(
        padding: REdgeInsets.only(left: 30, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Text(
              name!.tr,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(
                  100,
                ),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
          ],
        ),
      ),
    );
  }
}
