import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lunch_app/login/app_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lunch_app/notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  notification myNotification = notification();
  await myNotification.initilizeNotification();
 await myNotification.showNotification(1, 'hello guys', 'Update your lunch');

  await Firebase.initializeApp();
  runApp(const LunchApp());
}
