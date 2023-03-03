import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/constants/const.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CategoryCard({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60).r,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          children: [
            Image.network(
              '$baseUrl$imageUrl',
              width: ScreenUtil().setWidth(800),
              height: ScreenUtil().setHeight(200),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20).r,
              child: Text(
                '$name',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: ScreenUtil().setSp(47),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
