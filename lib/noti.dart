import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class noti {
  static Future<dynamic> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitilize =
        new AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettings =
        new InitializationSettings(android: androidInitilize);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future<dynamic> showBigTextNotification(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifies =
        new AndroidNotificationDetails("channelId", " applicationName",
            playSound: true,
            importance: Importance.max,
            //sound: RawResourceAndroidNotificationSound('Notification'),
            priority: Priority.high);
    var not = NotificationDetails(android: androidPlatformChannelSpecifies);

    DateTime scheduleDate = DateTime.now().add(
      Duration(seconds: 5),
    );

    await fln.zonedSchedule(
        0,
        "sample Notification",
        "This is a notification",
        androidAllowWhileIdle: true,
        tz.TZDateTime.from(scheduleDate, tz.local),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'Scheduled Default Notification Payload',
        not);
  }
}
