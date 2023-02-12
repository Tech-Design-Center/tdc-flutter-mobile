import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/service/remote_service/remote_category_service.dart';

import '../model/ad_banner.dart';
import '../model/category.dart';
import '../service/remote_service/remote_banner_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;

  @override
  void onInit() async {
    getAdBanners();
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
}
