import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../model/category.dart';
import '../../../categories_screen/category_course_screen/category_course_list_screen.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  final List<Category> categories;
  final ScrollController? scrollController;
  const CategoryListView({Key? key, required this.categories, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(400),
      width: ScreenUtil().screenWidth,
      child: ListView.separated(
        controller: scrollController,
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: REdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 60.h,
          );
        },
      ),
    );
  }
}
