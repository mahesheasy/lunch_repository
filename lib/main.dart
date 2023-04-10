import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lunch_app/login/app_state.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:timezone/standalone.dart';

// ignore: unused_import

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZone();
  await Firebase.initializeApp();
  runApp(const LunchApp());
}
