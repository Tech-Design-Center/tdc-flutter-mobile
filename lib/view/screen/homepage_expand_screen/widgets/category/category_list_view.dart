import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/category.dart';
import 'category_card.dart';

class CategoryListView extends StatefulWidget {
  final List<Category> categoryList;
  const CategoryListView({Key? key, required this.categoryList})
      : super(key: key);

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  int _currentIndex = 0;
  late List<Widget> _categoryList;

  @override
  void initState() {
    _categoryList = widget.categoryList.map((e) {
      return CategoryCard(
        imageUrl: e.image,
        name: e.name,
      );
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 90, right: 8).r,
        child: Container(
          height: ScreenUtil().setHeight(450),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 40, left: 20, right: 20).r,
            children: _categoryList,
          ),
        ));
  }
}
