import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/models/mood_model.dart';
import 'package:damodi_daily_mood_diary/services/firebase_service.dart';
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

  FirebaseService recordService = FirebaseService();

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

    try {
      await recordService.addMood(image, mood, description, moodLabel, title,
          imageUrl, user, selectedImage);

      await getMoodByDate();

      // Reset the form
      mood = MoodState.none;
      moodLabel = 'Select Your Mood';
      title = null;
      description = null;
      imageUrl = null;
      image = null;

      await Future.delayed(const Duration(seconds: 2));

      state = MyState.success;
      notifyListeners();
      selectedImage = ImageState.none;
    } catch (e) {
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
      List<MoodModel> listMoodFirebase =
          await recordService.getMoodByDate(user, selectedDate);

      listMood.addAll(listMoodFirebase);

      await Future.delayed(const Duration(seconds: 1));

      state = MyState.success;
      notifyListeners();
    } catch (e) {
      state = MyState.error;
      notifyListeners();
    }
  }

  Future<void> deleteMood(MoodModel mood) async {
    state = MyState.loading;
    notifyListeners();

    try {
      await recordService.deleteMood(mood);

      // Remove the mood from the list
      listMood.remove(mood);

      await Future.delayed(const Duration(seconds: 2));

      state = MyState.success;
      notifyListeners();
    } catch (e) {
      state = MyState.error;
      notifyListeners();
    }
  }

  Future<void> updateMood(MoodModel moodEdit) async {
    state = MyState.loading;
    notifyListeners();

    if (mood == MoodState.none) {
      mood = moodEdit.mood;
      moodLabel = moodEdit.moodLabel;
    }

    if (image == null) {
      imageUrl = moodEdit.imageUrl;
    } else {
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');

      Reference referenceImageToUpload =
          referenceDirImages.child(uniqueFileName);

      await referenceImageToUpload.putFile(File(image!.path));
      imageUrl = await referenceImageToUpload.getDownloadURL();

      // Delete the image file from Storage
      final storageRef = FirebaseStorage.instance.refFromURL(moodEdit.imageUrl);
      await storageRef.delete();
    }

    try {
      await recordService.updateMood(
          mood, description, moodLabel, title, imageUrl, moodEdit);

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
    } catch (e) {
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
