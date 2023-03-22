import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/homepage_expand_screen/widgets/recommend/recommend_card.dart';

import '../../../../../model/category.dart';
import '../../../../../model/recommend.dart';
import '../category/category_card.dart';

class RecommendListView extends StatefulWidget {
  final List<Recommend> recommendList;
  const RecommendListView({Key? key, required this.recommendList})
      : super(key: key);

  @override
  State<RecommendListView> createState() => _RecommendListViewState();
}

class _RecommendListViewState extends State<RecommendListView> {
  late List<Widget> _recommendList;

  @override
  void initState() {
    _recommendList = widget.recommendList.map((e) {
      return RecommendCard(
        imageUrl: e.image.first,
        title: e.title.toString(),
        author: e.author.toString(),
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(1050),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 40, left: 20, right: 20).r,
        children: _recommendList,
      ),
    );
  }
}
