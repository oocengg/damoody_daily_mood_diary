import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/models/mood_model.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/image_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecordProvider extends ChangeNotifier {
  MyState state = MyState.none;

  XFile? image;

  MoodState? mood;
  String? description;
  String moodLabel = 'Select Your Mood';
  String? title;
  String? imageUrl;
  User? user = FirebaseAuth.instance.currentUser;
  ImageState selectedImage = ImageState.none;

  List<MoodModel> listMood = [];

  DateTime selectedDate = DateTime.now();

  void updateSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();

    getMoodByDate();
  }

  CollectionReference moodRecord =
      FirebaseFirestore.instance.collection('mood_record');

  RecordProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      this.user = user;
      notifyListeners();
    });
    getMoodByDate();
  }

  void setMood(MoodState value) {
    mood = value;
    notifyListeners();
  }

  void setMoodLabel(MoodState value) {
    if (value == MoodState.sad) {
      moodLabel = 'Sad';
    } else if (value == MoodState.tired) {
      moodLabel = 'Tired';
    } else if (value == MoodState.neutral) {
      moodLabel = 'Neutral';
    } else if (value == MoodState.cheerful) {
      moodLabel = 'Cheerful';
    } else if (value == MoodState.excited) {
      moodLabel = 'Excited';
    } else if (value == MoodState.happy) {
      moodLabel = 'Happy';
    } else {
      moodLabel = 'Select Your Mood';
    }
    notifyListeners();
  }

  void setImage(XFile value) {
    image = value;
    selectedImage = ImageState.selected;
    notifyListeners();
  }

  void setTitle(String value) {
    title = value;
    notifyListeners();
  }

  void setDesc(String value) {
    description = value;
    notifyListeners();
  }

  Future<void> addMood() async {
    state = MyState.loading;
    notifyListeners();

    if (image == null) {
      selectedImage = ImageState.notSelected;
      notifyListeners();

      state = MyState.none;
      notifyListeners();

      return;
    }

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

        // Reset the form
        mood = MoodState.none;
        moodLabel = 'Select Your Mood';
        title = null;
        description = null;
        imageUrl = null;
        image = null;

        await Future.delayed(const Duration(seconds: 2));
        // getMoodByDate();

        state = MyState.success;
        notifyListeners();
        selectedImage = ImageState.none;
      } catch (error) {
        // Reset the form
        mood = MoodState.none;
        moodLabel = 'Select Your Mood';
        title = null;
        description = null;
        imageUrl = null;
        image = null;
        selectedImage = ImageState.none;

        state = MyState.error;
        notifyListeners();
      }
    } catch (error) {
      // Reset the form
      mood = MoodState.none;
      moodLabel = 'Select Your Mood';
      title = null;
      description = null;
      imageUrl = null;
      image = null;

      selectedImage = ImageState.none;

      state = MyState.error;
      notifyListeners();
    }
  }

  Future<void> getMoodByDate() async {
    state = MyState.loading;
    notifyListeners();

    listMood.clear();
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

      await Future.delayed(const Duration(seconds: 2));

      state = MyState.success;
      notifyListeners();
    } catch (e) {
      print(e);
      print(e);

      state = MyState.error;
      notifyListeners();
    }
  }

  // Future<void> deleteMood(String id) async {
  //   state = MyState.loading;
  //   notifyListeners();

  //   try {
  //     await moodRecord.doc(id).delete();

  //     listMood.removeWhere((mood) => mood.id == id);

  //     await Future.delayed(const Duration(seconds: 2));

  //     state = MyState.success;
  //     notifyListeners();
  //   } catch (error) {
  //     state = MyState.error;
  //     notifyListeners();
  //   }
  // }

  String? validateTitle(value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }

    List<String> words = value.split(' ');
    for (String word in words) {
      if (word.isEmpty || word[0].toUpperCase() != word[0]) {
        return 'Each word should start with a capital letter';
      }
    }

    return null;
  }

  String? validateDesc(value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }

    return null;
  }
}
