import 'package:get/get.dart';

import '../model/category.dart';
import '../service/remote_service/remote_category_service.dart';


class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);
     
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
