import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tdc_frontend_mobile/service/push_notification_service.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_screen.dart';
import 'firebase_options.dart';

///create object
RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
PushNotificationService pushNotificationService = PushNotificationService();
var token;

Future<void> main() async {
  configLoading();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///FlutterNativeSplash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///FirebaseMessaging
  pushNotificationService.initialize();

  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  debugPrint('Token: $token');

  ///run app
  runApp(const MyApp());
}

///Main widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 3120),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Tech Design Center',
          home: token == null ? OnboardingScreen() : DashboardScreen(),
          navigatorObservers: [routeObserver],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

///configLoading method
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
