import 'package:alarmapp/local_notification_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  List myHour = [16, 16, 16, 17, 18];
  List myMinutes = [2, 3, 4, 5, 6];

  setAlarm(){
    FlutterAlarmClock.createAlarm(17, 10, title: "Hello Shakeeb");
    FlutterAlarmClock.createAlarm(17, 18, title: "Hello Flutter Developer");
    FlutterAlarmClock.createAlarm(17, 30, title: "Hello Python Developer");
    FlutterAlarmClock.createAlarm(17, 55, title: "Go Developer");
    FlutterAlarmClock.createAlarm(18, 00, title: "Kotlin Developer");
  }


  NotificationsServices notificationsServices = NotificationsServices();

  @override
  void initState() {
    setAlarm();
    super.initState();
    notificationsServices.initializeNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green.withOpacity(0.5),
        // appBar: AppBar(
        //   title: const Text('Flutter alarm clock example'),
        // ),
        // body: Center(
        //     child: Column(children: <Widget>[
        //       Container(
        //         margin: const EdgeInsets.all(25),
        //         child: TextButton(
        //           child: const Text(
        //             'Create alarm at 0:1',
        //             style: TextStyle(fontSize: 20.0),
        //           ),
        //           onPressed: () {
        //             FlutterAlarmClock.createAlarm(16, 37, title: "Hello Shakeeb");
        //           },
        //         ),
        //       ),
        //       Container(
        //         margin: const EdgeInsets.all(25),
        //         child: TextButton(
        //           child: const Text(
        //             'Show alarms',
        //             style: TextStyle(fontSize: 20.0),
        //           ),
        //           onPressed: () {
        //             FlutterAlarmClock.showAlarms();
        //           },
        //         ),
        //       ),
        //       Container(
        //         margin: const EdgeInsets.all(25),
        //         child: TextButton(
        //           child: const Text(
        //             'Create timer for 42 seconds',
        //             style: TextStyle(fontSize: 20.0),
        //           ),
        //           onPressed: () {
        //             FlutterAlarmClock.createTimer(42);
        //           },
        //         ),
        //       ),
        //       Container(
        //         margin: const EdgeInsets.all(25),
        //         child: TextButton(
        //           child: const Text(
        //             'Show Timers',
        //             style: TextStyle(fontSize: 20.0),
        //           ),
        //           onPressed: () {
        //             FlutterAlarmClock.showTimers();
        //           },
        //         ),
        //       ),
        //     ])),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                notificationsServices.sendNotification("Hello Shakeeb Khan", "Flutter Developer");
              },
              child: const Center(
                child: Text("Flutter Static Alarm", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                notificationsServices.scheduleNotification("Namaz Isha", "Take break and go for offering prayer");
              },
              child: const Center(
                child: Text("Periodically", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
              ),
            ),
          ],
        )
      ),
    );
  }
}