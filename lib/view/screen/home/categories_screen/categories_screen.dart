import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/local_data/category_list.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/categories_screen/categories_list_view.dart';
import 'package:tdc_frontend_mobile/view/screen/home/notifications_screen/widgets/listsketchingtran_item_widget.dart';
import 'package:tdc_frontend_mobile/view/screen/widgets/section_title_screen.dart';

import '../../../../controller/controllers.dart';
import 'categories_loading.dart';

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
              if (homeController.categoryList.isNotEmpty) {
                return CategoriesListView(
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
