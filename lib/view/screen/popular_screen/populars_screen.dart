import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/category_list.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/categories_screen/categories_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/homepage_expand_screen/widgets/popular/popular_list_view.dart';
import 'package:tdc_frontend_mobile/view/screen/homepage_expand_screen/widgets/popular/popular_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/notifications_screen/widgets/listsketchingtran_item_widget.dart';
import 'package:tdc_frontend_mobile/view/screen/popular_screen/populars_list_view.dart';
import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';

import '../../../controller/controllers.dart';

class PopularsScreen extends StatelessWidget {
  const PopularsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SectionTitleScreen(
              name: 'Populars',
            ),
            //categories data
            Obx(() {
              print(homeController.popularList.length);
              if (homeController.popularList.isNotEmpty) {
                return PopularsListView(populars: homeController.popularList);
              } else {
                return CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}
