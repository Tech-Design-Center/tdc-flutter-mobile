import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    AwesomeNotifications().initialize(
        null,
        NotificationChannel(channelKey: 'basic_channel', channelName: '', channelDescription: '')
            as List<NotificationChannel>);

    await _fcm.requestPermission();
    await _fcm.subscribeToTopic('all');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');
      debugPrint('Message title: ${message.notification?.title}');
      debugPrint('Message body: ${message.notification?.body}');

      if (message.notification != null) {
        debugPrint('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');
      debugPrint('Message data: ${message.data}');
      debugPrint('Message title: ${message.notification?.title}');
      debugPrint('Message body: ${message.notification?.body}');
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
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    return token;
  }
}
