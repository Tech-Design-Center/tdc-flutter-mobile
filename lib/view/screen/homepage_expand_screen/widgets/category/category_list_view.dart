import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/data/category_list.dart';

import '../../../../../model/category.dart';
import '../../../categories_screen/category_course_screen/category_course_list_screen.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  final List<Category> categories;
  const CategoryListView({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(400),
      width: MediaQuery.of(context).size.width * 1,
      child: Expanded(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 40).r,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          },
        ),
      ),
    );
  }
}
