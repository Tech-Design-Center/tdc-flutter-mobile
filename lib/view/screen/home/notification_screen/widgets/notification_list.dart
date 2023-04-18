import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/model/news_feed.dart';
import 'package:tdc_frontend_mobile/model/notification.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_card.dart';
import 'package:tdc_frontend_mobile/view/screen/home/notification_screen/widgets/notification_card.dart';

class NotificationList extends StatelessWidget {
  final List<Notifications> notifications;
  const NotificationList({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationCard(
                  notifications: notifications.reversed.toList()[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
