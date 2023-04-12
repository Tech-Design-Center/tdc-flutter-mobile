import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/model/recommend.dart';

import 'recommends_card.dart';

class RecommendsListView extends StatelessWidget {
  final List<Recommend> recommends;
  const RecommendsListView({Key? key, required this.recommends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24).r,
          separatorBuilder: (context, index) {
            return SizedBox(height: 60.h);
          },
          itemCount: recommends.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return RecommendsCard(recommend: recommends[index]);
          }),
    );
  }
}
