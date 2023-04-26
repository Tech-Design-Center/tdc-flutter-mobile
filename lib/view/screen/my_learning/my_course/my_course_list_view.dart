import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/model/course.dart';
import 'package:tdc_frontend_mobile/view/screen/home/categories_screen/category_card.dart';
import 'package:tdc_frontend_mobile/view/screen/my_learning/my_course/my_course_card.dart';
import 'package:tdc_frontend_mobile/view/screen/home/popular_screen/populars_card.dart';

import '../../../../controller/controllers.dart';

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
      ),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: course.length,
          itemBuilder: (context, index) {
            if (authController.user.value!.email == course[index].email) {
              return MyCourseCard(course: course[index]);
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
