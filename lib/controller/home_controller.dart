import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/service/remote_service/remote_category_service.dart';
import 'package:tdc_frontend_mobile/service/remote_service/remote_popular_service.dart';
import 'package:tdc_frontend_mobile/service/remote_service/remote_recommend_service.dart';

import '../model/ad_banner.dart';
import '../model/category.dart';
import '../model/recommend.dart';
import '../service/remote_service/remote_banner_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxList<Recommend> recommendList = List<Recommend>.empty(growable: true).obs;
  RxList<Recommend> popularList = List<Recommend>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isRecommendLoading = false.obs;
  RxBool isPopularLoading = false.obs;

  @override
  void onInit() async {
    getAdBanners();
    getCategories();
    getRecommend();
    getPopular();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //call api
      var result = await RemoteBannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save api result to local db

      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getCategories() async {
    // print('controller category $categoryList.length');

    try {
      isCategoryLoading(true);
      //call api
      var result = await RemoteCategoryService().get();
      if (result != null) {
        //assign api result
        categoryList.assignAll(categoryListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getRecommend() async {
    try {
      isRecommendLoading(true);
      //call api
      var result = await RemoteRecommendService().get();
      if (result != null) {
        //assign api result
        recommendList.assignAll(recommendListFromJson(result.body));
        //save api result to local db

      }
    } finally {
      isRecommendLoading(false);
    }
  }

  void getPopular() async {
    try {
      isPopularLoading(true);
      //call api
      var result = await RemotePopularService().get();
      if (result != null) {
        //assign api result
        popularList.assignAll(recommendListFromJson(result.body));
        //save api result to local db

      }
    } finally {
      isPopularLoading(false);
    }
  }
}
