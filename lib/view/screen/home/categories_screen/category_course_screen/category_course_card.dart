import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/constants.dart';
import 'package:tdc_frontend_mobile/view/screen/home/course_details_screen.dart';

import '../../../../../model/category.dart';

class CategoryCourseCard extends StatelessWidget {
  final Category categories;

  CategoryCourseCard({required this.categories});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24).r,
          separatorBuilder: (context, index) {
            return SizedBox(height: 60.h);
          },
          itemCount: categories.title!.length,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(CourseDetailsScreen(
                  author: categories.author![index],
                  description: categories.description![index],
                  duration: categories.duration![index],
                  image: categories.imageCourse![index],
                  isEnroll: false,
                  playlistTitle: categories.playlistTitle![index],
                  price: categories.price![index],
                  title: categories.title![index],
                  videoTitle: categories.videoTitle![index],
                  videoTrailerURL: categories.videoTrailerURL![index],
                  videoUrl: categories.videoUrl![index],
                  ABAPaymentURL: categories.ABAPaymentURL![index],
                  documentsURL: categories.documentURL![index],
                  purchaseDate: DateTime(2023,1,1),
                  telegramURL: '',

                ));
              },
              child: Container(
                width: ScreenUtil().screenWidth,
                margin: EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                ).r,
                decoration: BoxDecoration(
                  color: ColorConstant.gray50,
                  borderRadius: BorderRadius.circular(
                    ScreenUtil().setWidth(
                      16.00,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.black9001e,
                      spreadRadius: ScreenUtil().setWidth(
                        0.00,
                      ),
                      blurRadius: ScreenUtil().setWidth(
                        10.00,
                      ),
                      offset: Offset(
                        0,
                        4,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 16,
                      ).r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().setWidth(
                            12.00,
                          ),
                        ),
                        child: Image.network(
                          categories.imageCourse![index],
                          height: ScreenUtil().setHeight(
                            400.00,
                          ),
                          width: ScreenUtil().setWidth(
                            400.00,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 50,
                        top: 22,
                        right: 16,
                        bottom: 19,
                      ).r,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 10,
                            ).r,
                            child: Text(
                              categories.title![index],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(
                                  60,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 1.00,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 40,
                              right: 10,
                            ).r,
                            child: Text(
                              categories.author![index],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorConstant.bluegray500,
                                fontSize: ScreenUtil().setSp(
                                  50,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 5.h,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 60,
                            ).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                      left: 14,
                                      top: 15,
                                      bottom: 4,
                                    ).r,
                                    child: Icon(
                                      Icons.video_collection,
                                      color: Colors.grey,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 15,
                                    bottom: 4,
                                  ).r,
                                  child: Text(
                                    "10 ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(
                                        60,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    top: 15,
                                    bottom: 4,
                                  ).r,
                                  child: Text(
                                    "Videos ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(
                                        60,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 300,
                                    top: 15,
                                    bottom: 2,
                                  ).r,
                                  child: Text(
                                    "${Constants.currency}" + categories.price![index].toString(),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: ColorConstant.indigoA200,
                                      fontSize: ScreenUtil().setSp(
                                        60,
                                      ),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.00,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
