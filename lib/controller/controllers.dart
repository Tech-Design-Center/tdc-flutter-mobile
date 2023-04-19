import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/auth_controller.dart';
import 'package:tdc_frontend_mobile/controller/home_controller.dart';
import 'package:tdc_frontend_mobile/controller/my_course_controller.dart';
import 'package:tdc_frontend_mobile/controller/setting_controller.dart';

HomeController homeController = Get.put(HomeController());
AuthController authController = Get.put(AuthController());
SettingController settingController = Get.put(SettingController());
MyCourseController myCourseController = Get.put(MyCourseController());
