import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tdc_frontend_mobile/view/screen/recommend_screen/recommends_loading.dart';
import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';

import '../../../controller/controllers.dart';
import '../recommend_screen/recommends_list_view.dart';

class RecommendsScreen extends StatelessWidget {
  const RecommendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(
              name: 'Populars',
            ),
            //categories data
            Obx(() {
              print(homeController.recommendList.length);
              if (homeController.recommendList.isNotEmpty) {
                return RecommendsListView(
                    recommends: homeController.recommendList);
              } else {
                return RecommendsLoading();
              }
            }),
          ],
        ),
      ),
    );
  }
}