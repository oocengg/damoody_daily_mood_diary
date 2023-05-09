// import 'package:cron/cron.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  Future<void> initializeNotifications() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  sendNotification(String title, String desc) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      desc,
      notificationDetails,
    );
  }

  // Schedule sesuai dengan time yang dimasukkan

  Future<void> scheduleTodayNotification() async {
    var dateTimeMorning = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0, 0);
    var dateTimeAfternoon = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 12, 30, 0);
    var dateTimeEvening = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 21, 0, 0);
    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      'Good Morning! Have A Great Day.',
      'Start your day with smile and fill your journal. Make a wish and pray for this day.',
      tz.TZDateTime.from(dateTimeMorning, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          1.toString(),
          'Mood Record',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      'It\'s midday! Have you lunch ?',
      'Take a few moments to reflect on your day so far and jot down your current mood in your journal.',
      tz.TZDateTime.from(dateTimeAfternoon, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          2.toString(),
          'Mood Record',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      'Good Evening! How was your day ?',
      'Before you wind down for the night, take some time to reflect on your day and capture your current mood in your journal.',
      tz.TZDateTime.from(dateTimeEvening, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          3.toString(),
          'Mood Record',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    // Test

    // var testDateTimeMorning = DateTime(DateTime.now().year,
    //     DateTime.now().month, DateTime.now().day, 9, 52, 0);
    // var test2DateTimeMorning = DateTime(DateTime.now().year,
    //     DateTime.now().month, DateTime.now().day, 10, 0, 0);
    // await _flutterLocalNotificationsPlugin.zonedSchedule(
    //   9,
    //   'Test',
    //   'Test 1 Desc',
    //   tz.TZDateTime.from(testDateTimeMorning, tz.local),
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       9.toString(),
    //       'Mood Record',
    //       importance: Importance.max,
    //       priority: Priority.max,
    //       icon: '@mipmap/ic_launcher',
    //     ),
    //   ),
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   matchDateTimeComponents: DateTimeComponents.time,
    // );
    // await _flutterLocalNotificationsPlugin.zonedSchedule(
    //   10,
    //   'Test',
    //   'Test 2 Desc',
    //   tz.TZDateTime.from(test2DateTimeMorning, tz.local),
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       9.toString(),
    //       'Mood Record',
    //       importance: Importance.max,
    //       priority: Priority.max,
    //       icon: '@mipmap/ic_launcher',
    //     ),
    //   ),
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   matchDateTimeComponents: DateTimeComponents.time,
    // );
  }

  Future<void> scheduleNextdayNotification() async {
    var dateTimeMorning = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 7, 0, 0);
    var dateTimeAfternoon = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 12, 30, 0);
    var dateTimeEvening = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 21, 0, 0);
    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      4,
      'Good Morning! Have A Great Day.',
      'Start your day with smile and fill your journal. Make a wish and pray for this day.',
      tz.TZDateTime.from(dateTimeMorning, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          4.toString(),
          'Mood Record',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      5,
      'It\'s midday! Have you lunch ?',
      'Take a few moments to reflect on your day so far and jot down your current mood in your journal.',
      tz.TZDateTime.from(dateTimeAfternoon, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          5.toString(),
          'Mood Record',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      6,
      'Good Evening! How was your day ?',
      'Before you wind down for the night, take some time to reflect on your day and capture your current mood in your journal.',
      tz.TZDateTime.from(dateTimeEvening, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          6.toString(),
          'Mood Record',
          importance: Importance.max,
          priority: Priority.max,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // Schedule dengan Cron

  // Future<void> scheduleNotification() async {
  //   final cron = Cron();
  //   cron.schedule(Schedule.parse('53 18 * * *'), () async {
  //     await sendNotification(
  //         'Daily Notification 10', 'This is a daily notification.');
  //   });

  //   cron.schedule(Schedule.parse('55 18 * * *'), () async {
  //     await sendNotification(
  //         'Daily Notification 12', 'This is a daily notification.');
  //   });
  //   cron.schedule(Schedule.parse('57 18 * * *'), () async {
  //     await sendNotification(
  //         'Daily Notification 14', 'This is a daily notification.');
  //   });
  //   cron.schedule(Schedule.parse('59 18 * * *'), () async {
  //     await sendNotification(
  //         'Daily Notification 16', 'This is a daily notification.');
  //   });
  // }

  // Schedule Every Minute

  // void scheduleNotification() async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       const AndroidNotificationDetails(
  //     'channelId',
  //     'channelName',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );

  //   NotificationDetails notificationDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //   );

  //   await _flutterLocalNotificationsPlugin.periodicallyShow(
  //     0,
  //     'Test Title',
  //     'Test Body',
  //     RepeatInterval.everyMinute,
  //     notificationDetails,
  //   );
  // }

  void stopNotifications() async {
    _flutterLocalNotificationsPlugin.cancel(0);
  }
}
