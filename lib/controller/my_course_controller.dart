import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/model/course.dart';
import 'package:tdc_frontend_mobile/model/popular.dart';
import 'package:tdc_frontend_mobile/service/category_service.dart';
import 'package:tdc_frontend_mobile/service/news_feed_service.dart';
import 'package:tdc_frontend_mobile/service/popular_service.dart';
import 'package:tdc_frontend_mobile/service/recommend_service.dart';

import '../model/ad_banner.dart';
import '../model/category.dart';
import '../model/news_feed.dart';
import '../model/recommend.dart';
import '../service/banner_service.dart';
import '../service/course_service.dart';

class MyCourseController extends GetxController {
  RxList<Course> courseList = List<Course>.empty(growable: true).obs;

  RxBool isCourseLoading = false.obs;
  late Course course;

  @override
  void onInit() async {
    super.onInit();
  }

  void getByEmail({required String? email}) async {
    try {
      isCourseLoading(true);
      //call api
      var result = await CourseService().get(email: email);
      if (result != null) {
        //assign api result
        courseList.assignAll(courseListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isCourseLoading(false);
    }
  }
}
