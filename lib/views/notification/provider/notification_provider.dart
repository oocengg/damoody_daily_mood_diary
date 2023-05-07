import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/models/notification_model.dart';
import 'package:damodi_daily_mood_diary/services/notification_service.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  MyState state = MyState.none;
  NotificationService notificationsServices = NotificationService();

  String? title;
  String? description;

  User? user = FirebaseAuth.instance.currentUser;

  List<NotificationModel> listTodayNotification = [];
  List<NotificationModel> listOlderNotification = [];

  CollectionReference notificationRecord =
      FirebaseFirestore.instance.collection('notification_record');

  NotificationProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      this.user = user;
      notifyListeners();
    });
    getNotificationByWeek();
  }

  Future<void> addNotification() async {
    state = MyState.loading;
    notifyListeners();

    final hour = DateTime.now().hour;
    if (hour < 12) {
      title = 'Good Morning! Have A Great Day.';
      description =
          'Start your day with smile and fill your journal. Make a wish and pray for this day.';
    } else if (hour < 19) {
      title = 'It\'s midday! Have you lunch ?';
      description =
          'Take a few moments to reflect on your day so far and jot down your current mood in your journal.';
    } else {
      title = 'Good Evening! How was your day ?';
      description =
          'Before you wind down for the night, take some time to reflect on your day and capture your current mood in your journal.';
    }

    try {
      await notificationRecord.add({
        'title': title,
        'description': description,
        'created_at': DateTime.now(),
        'is_active': true,
        'user_id': user!.uid,
      });

      // Call sendNotification function here
      await notificationsServices.sendNotification(title!, description!);

      // Reset the form
      title = null;
      description = null;

      await getNotificationByWeek();

      state = MyState.success;
      notifyListeners();
    } catch (error) {
      // Reset the form
      title = null;
      description = null;

      state = MyState.error;
      notifyListeners();
    }
  }

  Future<void> getNotificationByWeek() async {
    state = MyState.loading;
    notifyListeners();

    listTodayNotification.clear();
    listOlderNotification.clear();
    try {
      final today = DateTime.now();
      final tomorrow = today.add(const Duration(days: 1));
      final startOfToday = DateTime(today.year, today.month, today.day);
      final endOfTomorrow =
          DateTime(tomorrow.year, tomorrow.month, tomorrow.day)
              .subtract(const Duration(milliseconds: 1));

      final querySnapshotToday = await notificationRecord
          .where('user_id', isEqualTo: user!.uid)
          .where('created_at',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfToday))
          .where('created_at',
              isLessThanOrEqualTo: Timestamp.fromDate(endOfTomorrow))
          .get();
      for (var value in querySnapshotToday.docs) {
        listTodayNotification.add(
          NotificationModel.fromDocument(
            value as DocumentSnapshot<Map<String, dynamic>>,
          ),
        );
      }

      final querySnapshotOlder = await notificationRecord
          .where('user_id', isEqualTo: user!.uid)
          .where('created_at', isLessThan: Timestamp.fromDate(startOfToday))
          .get();

      for (var value in querySnapshotOlder.docs) {
        listOlderNotification.add(
          NotificationModel.fromDocument(
            value as DocumentSnapshot<Map<String, dynamic>>,
          ),
        );
      }
      await Future.delayed(const Duration(seconds: 2));

      state = MyState.success;
      notifyListeners();
    } catch (e) {
      state = MyState.error;
      notifyListeners();
    }
  }

  Future<void> updateMood(NotificationModel notifEdit) async {
    // state = MyState.loading;
    // notifyListeners();

    try {
      await notificationRecord.doc(notifEdit.id).update({
        'is_active': false,
      });

      await getNotificationByWeek();
    } catch (e) {
      state = MyState.error;
      notifyListeners();
    }
  }
}
