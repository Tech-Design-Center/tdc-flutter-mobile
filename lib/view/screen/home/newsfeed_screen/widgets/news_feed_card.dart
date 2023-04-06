import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/model/news_feed.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class NewsFeedCard extends StatelessWidget {
  final NewsFeed newsFeed;

  NewsFeedCard({required this.newsFeed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(60),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: REdgeInsets.only(right: 30),
                child: Image.network(
                  newsFeed.image,
                  height: ScreenUtil().setHeight(
                    400.00,
                  ),
                  width: ScreenUtil().setWidth(
                    350.00,
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(850),
                child: Padding(
                  padding: REdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        newsFeed.title,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            60,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 5.h,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        newsFeed.description,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            40,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 5.h,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        timeago.format(newsFeed.publishedAt),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorConstant.bluegray500,
                          fontSize: ScreenUtil().setSp(
                            40,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.00,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Image.network(newsFeed.poster),
        ],
      ),
    );
  }
}
