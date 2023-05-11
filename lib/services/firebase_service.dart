import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/models/mood_model.dart';
import 'package:damodi_daily_mood_diary/models/notification_model.dart';
import 'package:damodi_daily_mood_diary/services/notification_service.dart';
import 'package:damodi_daily_mood_diary/utils/state/image_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseService {
  // Record Page
  CollectionReference moodRecord =
      FirebaseFirestore.instance.collection('mood_record');

  Future<void> addMood(
    XFile? image,
    MoodState? mood,
    String? description,
    String moodLabel,
    String? title,
    String? imageUrl,
    User? user,
    ImageState selectedImage,
  ) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    try {
      await referenceImageToUpload.putFile(File(image!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();

      try {
        await moodRecord.add({
          'mood': mood.toString().split('.').last,
          'label': moodLabel,
          'title': title,
          'description': description,
          'image_url': imageUrl,
          'created_at': DateTime.now(),
          'user_id': user!.uid,
        });

        getMoodByDate(user, DateTime.now());
      } catch (error) {
        rethrow;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<List<MoodModel>> getMoodByDate(
      User? user, DateTime selectedDate) async {
    final List<MoodModel> listMood = [];
    try {
      final querySnapshot = await moodRecord
          .where('user_id', isEqualTo: user!.uid)
          .where(
            'created_at',
            isGreaterThanOrEqualTo: DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              0,
              0,
              0,
              0,
              0,
            ),
          )
          .where(
            'created_at',
            isLessThanOrEqualTo: DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              23,
              59,
              59,
              999,
              999,
            ),
          )
          .get();

      for (var value in querySnapshot.docs) {
        listMood.add(
          MoodModel.fromDocument(
            value as DocumentSnapshot<Map<String, dynamic>>,
          ),
        );
      }

      return listMood;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateMood(
    MoodState? mood,
    String? description,
    String moodLabel,
    String? title,
    String? imageUrl,
    MoodModel? moodEdit,
  ) async {
    try {
      await moodRecord.doc(moodEdit!.id).update({
        'mood': mood.toString().split('.').last,
        'label': moodLabel,
        'title': title,
        'description': description,
        'image_url': imageUrl,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteMood(MoodModel mood) async {
    try {
      // Delete the mood document from Firestore
      await moodRecord.doc(mood.id).delete();

      // Delete the image file from Storage
      final storageRef = FirebaseStorage.instance.refFromURL(mood.imageUrl);
      await storageRef.delete();
    } catch (error) {
      rethrow;
    }
  }

  // Dashboard Page
  Future<List<MoodModel>> getMoodByWeek(User? user) async {
    final List<MoodModel> listMoodDashboard = [];
    try {
      final now = DateTime.now();
      // final now = DateTime(2023, 4, 26);
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final endOfWeek = startOfWeek.add(const Duration(days: 6));
      final startDateOfWeek =
          DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);

      final querySnapshot = await moodRecord
          .where('user_id', isEqualTo: user!.uid)
          .where(
            'created_at',
            isGreaterThanOrEqualTo: startDateOfWeek,
          )
          .where(
            'created_at',
            isLessThanOrEqualTo:
                endOfWeek.add(const Duration(days: 1, seconds: -1)),
          )
          .get();

      for (var value in querySnapshot.docs) {
        listMoodDashboard.add(
          MoodModel.fromDocument(
            value as DocumentSnapshot<Map<String, dynamic>>,
          ),
        );
      }
      return listMoodDashboard;
    } catch (e) {
      rethrow;
    }
  }

  // Profile Page
  Future<int> getDataCountByUserId(User? user) async {
    int countMood = 0;
    try {
      final querySnapshot =
          await moodRecord.where('user_id', isEqualTo: user!.uid).count().get();

      countMood = querySnapshot.count.toInt();

      return countMood;
    } catch (e) {
      rethrow;
    }
  }

  // Notification Page
  CollectionReference notificationRecord =
      FirebaseFirestore.instance.collection('notification_record');

  Future<void> addNotification(
    User? user,
    String? title,
    String? description,
  ) async {
    try {
      await notificationRecord.add({
        'title': title,
        'description': description,
        'created_at': DateTime.now(),
        'is_active': true,
        'user_id': user!.uid,
      });
    } catch (error) {
      // Reset the form
      title = '';
      description = '';

      rethrow;
    }
  }

  Future<List<NotificationModel>> getTodayNotification(User? user) async {
    final List<NotificationModel> listTodayNotification = [];

    listTodayNotification.clear();
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

      return listTodayNotification;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NotificationModel>> getOlderNotification(User? user) async {
    final List<NotificationModel> listOlderNotification = [];

    listOlderNotification.clear();
    try {
      final today = DateTime.now();
      final startOfToday = DateTime(today.year, today.month, today.day);

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

      return listOlderNotification;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateNotification(NotificationModel notifEdit) async {
    try {
      await notificationRecord.doc(notifEdit.id).update({
        'is_active': false,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAllNotification(User? user) async {
    try {
      final collection =
          await notificationRecord.where('user_id', isEqualTo: user!.uid).get();

      for (final doc in collection.docs) {
        await notificationRecord.doc(doc.id).delete();
      }
    } catch (error) {
      rethrow;
    }
  }
}
