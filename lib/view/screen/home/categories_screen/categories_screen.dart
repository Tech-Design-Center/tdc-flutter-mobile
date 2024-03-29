import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/view/screen/home/categories_screen/categories_list_view.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

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
            const SectionTitleScreen(
              name: 'Categories',
              isBackButton: true,
            ),
            //categories data
            Obx(() {
              if (homeController.categoryList.isNotEmpty) {
                return CategoriesListView(categories: homeController.categoryList);
              } else {
                return const CategoriesLoading();
              }
            }),
          ],
        ),
      ),
    );
  }
}
