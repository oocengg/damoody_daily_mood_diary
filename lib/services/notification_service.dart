import 'package:cron/cron.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

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

  Future<void> scheduleTodayNotification(
      int id, String title, String desc) async {
    var dateTimeMorning = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 7, 0, 0);
    var dateTimeAfternoon = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 12, 30, 0);
    var dateTimeEvening = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 21, 0, 0);
    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      desc,
      tz.TZDateTime.from(dateTimeMorning, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          id.toString(),
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
      id,
      title,
      desc,
      tz.TZDateTime.from(dateTimeAfternoon, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          id.toString(),
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
      id,
      title,
      desc,
      tz.TZDateTime.from(dateTimeEvening, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          id.toString(),
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

  Future<void> scheduleNextdayNotification(
      int id, String title, String desc) async {
    var dateTimeMorning = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 7, 0, 0);
    var dateTimeAfternoon = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 12, 30, 0);
    var dateTimeEvening = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day + 1, 21, 0, 0);
    tz.initializeTimeZones();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      desc,
      tz.TZDateTime.from(dateTimeMorning, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          id.toString(),
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
      id,
      title,
      desc,
      tz.TZDateTime.from(dateTimeAfternoon, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          id.toString(),
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
      id,
      title,
      desc,
      tz.TZDateTime.from(dateTimeEvening, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          id.toString(),
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

  // Future<void> scheduleDailyNotifications(
  //     int id, String title, String body) async {
  //   var androidDetails = AndroidNotificationDetails(
  //     id.toString(),
  //     'Mood Record',
  //     importance: Importance.max,
  //     priority: Priority.max,
  //     icon: '@mipmap/ic_launcher',
  //   );
  //   var platformDetails = NotificationDetails(android: androidDetails);

  //   // Jadwal notifikasi pada pukul 7 pagi
  //   var morningTime = Time(7, 0, 0);
  //   var morningTrigger =
  //       DailyTrigger(hour: morningTime.hour, minute: morningTime.minute);
  //   await _flutterLocalNotificationsPlugin.zonedSchedule(
  //     id * 2, // Gunakan ID yang berbeda agar notifikasi tidak tertimpa
  //     title,
  //     body,
  //     _nextInstanceOfTime(morningTime),
  //     platformDetails,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     payload: 'customData',
  //     matchDateTimeComponents: DateTimeComponents.time,
  //     recurrenceRule: RecurrenceRule.dailyAtTime(morningTrigger),
  //   );

  //   // Jadwal notifikasi pada pukul 9 malam
  //   var eveningTime = Time(21, 0, 0);
  //   var eveningTrigger =
  //       DailyTrigger(hour: eveningTime.hour, minute: eveningTime.minute);
  //   await _flutterLocalNotificationsPlugin.zonedSchedule(
  //     id * 2 + 1, // Gunakan ID yang berbeda agar notifikasi tidak tertimpa
  //     title,
  //     body,
  //     _nextInstanceOfTime(eveningTime),
  //     platformDetails,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     payload: 'customData',
  //     matchDateTimeComponents: DateTimeComponents.time,
  //     recurrenceRule: RecurrenceRule.dailyAtTime(eveningTrigger),
  //   );
  // }

  // fungsi untuk menentukan waktu notifikasi berikutnya
  // tz.TZDateTime _nextInstanceOfTime(Time time) {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate = tz.TZDateTime(
  //       tz.local, now.year, now.month, now.day, time.hour, time.minute);
  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }
  //   return scheduledDate;
  // }

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
