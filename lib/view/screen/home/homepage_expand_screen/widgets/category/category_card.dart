import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tdc_frontend_mobile/model/category.dart';

import '../../../categories_screen/category_course_screen/category_course_list_screen.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryCourseListScreen(categories: category, name: category.name));
      },
      child: Column(
        children: [
          Image.network(
            category.image!,
            width: ScreenUtil().setWidth(340),
            height: ScreenUtil().setHeight(200),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20).r,
            child: Text(
              category.name!,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: ScreenUtil().setSp(47),
              ),
            ),
          )
        ],
      ),
    );
  }
}
