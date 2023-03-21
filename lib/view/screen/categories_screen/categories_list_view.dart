import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/view/screen/categories_screen/category_card.dart';

import '../../../model/category.dart';
import '../course_screen/course_screen.dart';

class CategoryListView extends StatelessWidget {
  final List<Category> categories;
  const CategoryListView({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24).r,
          separatorBuilder: (context, index) {
            return SizedBox(height: 60.h);
          },
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => CourseScreen());
              },
              child: CategoryCard(categories: categories[index]),
            );
          }),
    );
  }
}
