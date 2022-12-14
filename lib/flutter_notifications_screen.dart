//
//
// import 'package:flutter/material.dart';
//
// class SetAlarm {
//   static Future<void> setAlarmtoStorage({
//     required int id,
//     TimeOfDay alarmTime,
//   }) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setStringList('$id', [alarmTime.hour.toString(), alarmTime.minute.toString()]);
//   }
//
//   static Future<TimeOfDay> getAlarmfromStorage({int id}) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     final hourAndMin = pref.getStringList('$id');
//     final time = TimeOfDay(
//       hour: int.parse(hourAndMin[0]),
//       minute: int.parse(hourAndMin[1]),
//     );
//     return time;
//   }
//
//   static Future<void> cancelAlarm(int id) async {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     await flutterLocalNotificationsPlugin.cancel(id);
//   }
//
//   static Future<void> setAlarm(TimeOfDay selectedTime, int id) async {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     tz.initializeTimeZones();
//     final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
//     print(currentTimeZone);
//     tz.setLocalLocation(tz.getLocation(currentTimeZone));
//     var notifydate;
//     final hour = (TimeOfDay.now().hour - selectedTime.hour).abs();
//     final min = (TimeOfDay.now().minute - selectedTime.minute).abs();
//     if (tz.TZDateTime.now(tz.local).isAfter(DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       selectedTime.hour,
//       selectedTime.minute,
//     ))) {
//       notifydate = tz.TZDateTime.local(DateTime.now().year, DateTime.now().month,
//           DateTime.now().add(Duration(days: 1)).day, selectedTime.hour, selectedTime.minute);
//       // tz.TZDateTime.now(tz.local)
//       //     .subtract(Duration(seconds: tz.TZDateTime.now(tz.local).second))
//       //     .add(Duration(days: 1, hours: hour, minutes: min));
//       print(notifydate.toString());
//       print('isAfter true(alarm time is after the now date)');
//     } else {
//       notifydate = tz.TZDateTime.now(tz.local)
//           .subtract(Duration(seconds: tz.TZDateTime.now(tz.local).second))
//           .add(Duration(hours: hour, minutes: min));
//       print('isAfter:false');
//     }
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'alarm_notify',
//       'alarm_notify',
//       'Channel for Alarm notification',
//       icon: 'time',
//       sound: RawResourceAndroidNotificationSound('alarm_ringtone'),
//       largeIcon: DrawableResourceAndroidBitmap('time'),
//       playSound: true,
//     );
//     var iOSPlatformChannelSpecifics = IOSNotificationDetails(
//       sound: 'alarm_ringtone.mp3',
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//     var platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       'Alarm',
//       'Wake Up!!!',
//       notifydate,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }