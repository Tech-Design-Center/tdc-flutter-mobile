import 'package:get/get.dart';
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

class HomeController extends GetxController {
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxList<Recommend> recommendList = List<Recommend>.empty(growable: true).obs;
  RxList<Popular> popularList = List<Popular>.empty(growable: true).obs;
  RxList<NewsFeed> newsFeedList = List<NewsFeed>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isRecommendLoading = false.obs;
  RxBool isPopularLoading = false.obs;
  RxBool isNewsFeedLoading = false.obs;
  RxBool isPlaylistVideoURLLoading = false.obs;

  @override
  void onInit() async {
    getAdBanners();
    getCategories();
    getRecommend();
    getPopular();
    getNewsFeed();
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
        popularList.assignAll(popularListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isPopularLoading(false);
    }
  }

  void getNewsFeed() async {
    try {
      isNewsFeedLoading(true);
      //call api
      var result = await NewsFeedService().get();
      if (result != null) {
        //assign api result
        newsFeedList.assignAll(newsFeedListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isNewsFeedLoading(false);
    }
  }
}
