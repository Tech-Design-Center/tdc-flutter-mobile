import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/screen/home/newsfeed_screen/widgets/news_feed_card.dart';

class NewsFeedListLoading extends StatelessWidget {
  const NewsFeedListLoading({
    super.key,
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return NewsFeedListLoading();
              },
            ),
          ],
        ),
      ),
    );
  }
}
