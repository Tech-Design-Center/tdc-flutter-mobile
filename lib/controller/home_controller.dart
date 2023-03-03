import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/service/remote_service/remote_category_service.dart';

import '../model/ad_banner.dart';
import '../model/category.dart';
import '../service/remote_service/remote_banner_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isRecommendLoading = false.obs;
  RxBool isPopularLoading = false.obs;

  @override
  void onInit() async {
    getAdBanners();
    getCategories();
    super.onInit();
  }

  void getAdBanners() async {
    print('controller category $categoryList.length');

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
}
