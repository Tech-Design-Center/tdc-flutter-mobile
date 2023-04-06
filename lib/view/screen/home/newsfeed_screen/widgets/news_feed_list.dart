import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/model/news_feed.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_card.dart';

class NewsFeedList extends StatelessWidget {
  final List<NewsFeed> newsFeed;
  NewsFeedList({
    super.key,
    required this.newsFeed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: newsFeed.length,
              itemBuilder: (context, index) {
                return NewsFeedCard(
                  newsFeed: newsFeed.reversed.toList()[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
