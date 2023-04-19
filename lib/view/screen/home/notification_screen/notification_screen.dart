import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_list.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_card.dart';
import 'package:tdc_frontend_mobile/view/screen/home/notification_screen/widgets/notification_list.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

import '../../../../controller/controllers.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SectionTitleScreen(name: 'Notification'),
            Obx(() {
              if (homeController.notificationList.isNotEmpty) {
                return NotificationList(
                  notifications: homeController.notificationList,
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
