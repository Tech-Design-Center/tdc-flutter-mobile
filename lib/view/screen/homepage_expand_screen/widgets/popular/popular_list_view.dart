import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/homepage_expand_screen/widgets/recommend/recommend_card.dart';

import '../../../../../model/category.dart';
import '../../../../../model/recommend.dart';
import '../category/category_card.dart';

class PopularListView extends StatefulWidget {
  final List<Recommend> popularList;
  const PopularListView({Key? key, required this.popularList})
      : super(key: key);

  @override
  State<PopularListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView> {
  int _currentIndex = 0;
  late List<Widget> _popularList;

  @override
  void initState() {
    _popularList = widget.popularList.map((e) {
      return RecommendCard(
        imageUrl: e.image,
        title: e.title,
        author: e.author,
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1050),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(top: 40, left: 20, right: 20).r,
        children: _popularList,
      ),
    );
  }
}
