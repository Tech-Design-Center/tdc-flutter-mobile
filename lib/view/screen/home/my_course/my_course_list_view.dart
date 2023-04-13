import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/model/course.dart';
import 'package:tdc_frontend_mobile/view/screen/home/categories_screen/category_card.dart';
import 'package:tdc_frontend_mobile/view/screen/home/my_course/my_course_card.dart';
import 'package:tdc_frontend_mobile/view/screen/home/popular_screen/populars_card.dart';

class MyCourseListView extends StatelessWidget {
  final List<Course> course;
  const MyCourseListView({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        left: 24,
        top: 35,
        right: 24,
      ).r,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: course.length,
          itemBuilder: (context, index) {
            return MyCourseCard(course: course[index]);
          }),
    );
  }
}
