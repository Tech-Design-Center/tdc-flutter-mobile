import 'package:flutter/material.dart';

import 'package:tdc_frontend_mobile/model/category.dart';
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
              isBackButton: true,
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
