import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/controller/auth_controller.dart';
import 'package:tdc_frontend_mobile/controller/home_controller.dart';

import 'dashboard_controller.dart';

HomeController homeController = Get.put(HomeController());
DashboardController dashboardController = Get.put(DashboardController());
AuthController authController = Get.put(AuthController());
