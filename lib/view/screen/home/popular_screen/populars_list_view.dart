import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/model/popular.dart';
import 'package:tdc_frontend_mobile/view/screen/home/categories_screen/category_card.dart';
import 'package:tdc_frontend_mobile/view/screen/home/popular_screen/populars_card.dart';

class PopularsListView extends StatelessWidget {
  final List<Popular> populars;
  const PopularsListView({Key? key, required this.populars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24).r,
          separatorBuilder: (context, index) {
            return SizedBox(height: 60.h);
          },
          itemCount: populars.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return PopularsCard(popular: populars[index]);
          }),
    );
  }
}
