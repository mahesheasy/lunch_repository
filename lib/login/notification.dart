import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lunch_app/home/home_page_buttons.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'dart:async';

class notification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initilizeNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings); 
  }

  Future<void> showNotification(int id, String title, String body) async {
    tz.initializeTimeZones();
    var SheduleDate1 = tz.TZDateTime.from(
        DateTime(now.year, now.month, now.day, 10, 0, 0), tz.local);
    var SheduleDate2 = tz.TZDateTime.from(
        DateTime(now.year, now.month, now.day, 10, 30, 0), tz.local);
    if (now.isBefore(SheduleDate1)) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        SheduleDate1,
        
        NotificationDetails(
          android: AndroidNotificationDetails(
            id.toString(),
            "update your lunch ",
            importance: Importance.max,
            priority: Priority.max,
            icon: "@mipmap/ic_launcher",
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
    if (now.isBefore(SheduleDate2)) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id + 1,
        "Alert..❗️",

        "time is too short..🕚  update your food broooo ;",
        SheduleDate2,
        
        NotificationDetails(
          android: AndroidNotificationDetails(
            (id + 1).toString(),
            "update your lunch ",
            importance: Importance.max,
            priority: Priority.max,
            icon: "@mipmap/ic_launcher",
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }
}
