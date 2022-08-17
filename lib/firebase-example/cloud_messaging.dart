import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fbm = FirebaseMessaging.instance;
  print(fbm.getToken());

  NotificationSettings settings = await fbm.requestPermission();
  print(settings.authorizationStatus);
  fbm.subscribeToTopic('chat');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Получено сообщение');
    print('Данные: ${message.data}');
    if (message.notification != null) {
      print('Сообщение также содержало уведомление: ${message.notification}');
    }
  });
}
