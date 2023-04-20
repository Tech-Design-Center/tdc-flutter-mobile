import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:tdc_frontend_mobile/model/category.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import '../../../../widgets/section_title_screen.dart';
import 'category_course_card.dart';

class CategoryCourseListScreen extends StatefulWidget {
  final String? name;
  final Category categories;
  const CategoryCourseListScreen({Key? key, required this.categories, required this.name})
      : super(key: key);

  @override
  State<CategoryCourseListScreen> createState() => _CategoryCourseListScreenState();
}

class _CategoryCourseListScreenState extends State<CategoryCourseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(
              name: widget.name,
            ),
            CategoryCourseCard(
              categories: widget.categories,
            )
          ],
        ),
      ),
    );
  }
}
