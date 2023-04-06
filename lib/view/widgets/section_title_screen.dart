import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SectionTitleScreen extends StatelessWidget {
  final String name;
  const SectionTitleScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text(
              name,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(
                  100,
                ),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.help_outline)),
          ],
        ),
      ),
    );
  }
}
