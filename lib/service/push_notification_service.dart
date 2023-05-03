import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  triggerNotification({required String? title, required String? body}) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: 'basic_channel',
      title: title,
      body: body,
    ));
  }

  Future initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _fcm.requestPermission();
    await _fcm.subscribeToTopic('all');

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        debugPrint('Got a message whilst in the foreground!');
        debugPrint('Message data: ${message.data}');
        debugPrint('Message title: ${message.notification?.title}');
        debugPrint('Message body: ${message.notification?.body}');

        ///display notification
        triggerNotification(title: message.notification!.title, body: message.notification!.body);

        ///post to notification entry
        homeController.postNotification(
            title: message.notification!.title, description: message.notification!.body);
        if (message.notification != null) {
          debugPrint('Message also contained a notification: ${message.notification}');
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');
      debugPrint('Message data: ${message.data}');
      debugPrint('Message title: ${message.notification?.title}');
      debugPrint('Message body: ${message.notification?.body}');

      ///display notification
      triggerNotification(title: message.notification!.title, body: message.notification!.body);

      ///post to notification entry
      homeController.postNotification(
          title: message.notification!.title, description: message.notification!.body);
      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification}');
      }
    });
  }

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    debugPrint('Handling a background message ${message.messageId}');
    debugPrint('Message title: ${message.notification?.title}');
    debugPrint('Message body: ${message.notification?.body}');

    ///display notification
    triggerNotification(title: message.notification!.title, body: message.notification!.body);

    ///post to notification entry
    homeController.postNotification(
        title: message.notification!.title, description: message.notification!.body);
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    return token;
  }
}
