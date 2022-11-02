
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings androidInitializationSettings =
  const AndroidInitializationSettings('@mipmap/ic_launcher');

  void initializeNotifications() async{

    InitializationSettings initializationSettings =
     InitializationSettings(
      android: androidInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }


  // TODO Simple Through Button Using Notification
  void sendNotification(String title, String body) async{

    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
        'channelId',
        'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =
    NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
        0,
        title,
        body,
        notificationDetails
    );
  }

  // TODO Periodically Showing Notification
  void scheduleNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
    const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =
    NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        title,
        body,
        RepeatInterval.everyMinute,
        notificationDetails);
  }

  // TODO Cancel Notifications
  void stopNotifiations() async{
    flutterLocalNotificationsPlugin.cancel(0);
  }

}