import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:googleapis/content/v2_1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';

import 'package:tdc_frontend_mobile/core/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tdc_frontend_mobile/service/push_notification_service.dart';
import 'package:tdc_frontend_mobile/translations.dart';

import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_screen.dart';

import 'firebase_options.dart';
import 'local_constant.dart';

///create object
RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
PushNotificationService pushNotificationService = PushNotificationService();
var token;

Future<void> main() async {
  AwesomeNotifications().initialize(
    'https://firebasestorage.googleapis.com/v0/b/techdesigncenter-84455.appspot.com/o/assets%2Flogo.png?alt=media&token=a89bbc1d-4716-4d6f-ae20-e67a6219c9a7',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification for basic test',
      ),
    ],
    debug: true,
  );
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
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          if (!isAllowed) {AwesomeNotifications().requestPermissionToSendNotifications()}
        });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        print("Preference Revoked ${locale.languageCode}");
        Get.updateLocale(locale);
        print("GET LOCALE Revoked ${Get.locale!.languageCode}");
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 3120),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          translations: TranslationsApp(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          title: 'Tech Design Center',
          home: token == null ? DashboardScreen() : DashboardScreen(),
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
