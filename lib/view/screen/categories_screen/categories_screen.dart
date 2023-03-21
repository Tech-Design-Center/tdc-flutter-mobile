import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/category_list.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/categories_screen/categories_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/course_screen/course_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/notifications_screen/widgets/listsketchingtran_item_widget.dart';
import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';

import '../../../controller/controllers.dart';
import 'categories_list_view.dart';
import 'category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(
              name: 'Categories',
            ),
            //categories data
            Obx(() {
              print(homeController.categoryList.length);
              if (homeController.categoryList.isNotEmpty) {
                return CategoryListView(
                    categories: homeController.categoryList);
              } else {
                return CategoriesLoading();
              }
            }),
          ],
        ),
      ),
    );
  }
}
