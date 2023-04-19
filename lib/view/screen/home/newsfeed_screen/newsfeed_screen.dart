import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_list.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_card.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

import '../../../../controller/controllers.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SectionTitleScreen(name: 'News Feed'),
            Obx(() {
              if (homeController.newsFeedList.isNotEmpty) {
                return NewsFeedList(
                  newsFeed: homeController.newsFeedList,
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
          ],
        ),
      ),
    );
  }
}
