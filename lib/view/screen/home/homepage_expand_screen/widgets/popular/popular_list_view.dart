import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/model/popular.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/widgets/recommend/recommend_card.dart';

import '../../../../../../model/category.dart';
import '../../../../../../model/recommend.dart';
import '../category/category_card.dart';
import '../popular/popular_card.dart';

class PopularListView extends StatelessWidget {
  final List<Popular> popularList;
  final ScrollController? scrollController;
  const PopularListView({Key? key, required this.popularList, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(1100),
      child: ListView.separated(
        itemCount: popularList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20).r,
        itemBuilder: (context, index) {
          return PopularCard(popular: popularList[index]);
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
