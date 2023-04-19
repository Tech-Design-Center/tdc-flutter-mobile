import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/recommend/recommend_card.dart';

import '../../../../../../model/category.dart';
import '../../../../../../model/recommend.dart';
import '../category/category_card.dart';

class RecommendListView extends StatelessWidget {
  final List<Recommend> recommendList;
  final ScrollController? scrollController;
  const RecommendListView({
    Key? key,
    required this.recommendList,
    required this.scrollController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(1100),
      child: ListView.separated(
        controller: scrollController,
        itemCount: recommendList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: REdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        itemBuilder: (context, index) {
          return RecommendCard(
            recommend: recommendList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 60.h,
          );
        },
      ),
    );
  }
}
