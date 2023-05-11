import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/models/api/quote_api.dart';
import 'package:damodi_daily_mood_diary/models/mood_model.dart';
import 'package:damodi_daily_mood_diary/models/quote_model.dart';
import 'package:damodi_daily_mood_diary/services/firebase_service.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  MyState state = MyState.none;

  User? user = FirebaseAuth.instance.currentUser;
  QuoteModel? quoteResponse;
  String errorMessage = '';
  int indexLatestMood = 0;

  FirebaseService recordService = FirebaseService();

  DashboardProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      this.user = user;
      notifyListeners();
    });
    getMoodByWeek();
    getHappyPercentage();
    getLatestMood();
    getSummaryLabel();
  }

  List<MoodModel> listMoodDashboard = [];

  CollectionReference moodRecord =
      FirebaseFirestore.instance.collection('mood_record');

  String getSalute() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning, ';
    } else if (hour < 19) {
      return 'Good Afternoon, ';
    } else {
      return 'Good Evening, ';
    }
  }

  Future<void> getQuote() async {
    state = MyState.loading;
    notifyListeners();

    try {
      quoteResponse = await QuoteApi().getQuote();

      state = MyState.success;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();

      state = MyState.error;
      notifyListeners();
    }
  }

  MoodModel? getLatestMood() {
    if (listMoodDashboard.isEmpty) {
      return null;
    } else {
      MoodModel latestMood = listMoodDashboard.reduce(
          (curr, next) => curr.createdAt.isAfter(next.createdAt) ? curr : next);

      indexLatestMood = listMoodDashboard.indexOf(latestMood);
      return latestMood;
    }
  }

  Future<void> getMoodByWeek() async {
    state = MyState.loading;
    notifyListeners();

    listMoodDashboard.clear();

    try {
      List<MoodModel> listMoodDashboardFirebase =
          await recordService.getMoodByWeek(user);

      listMoodDashboard.addAll(listMoodDashboardFirebase);

      await Future.delayed(const Duration(seconds: 2));

      state = MyState.success;
      notifyListeners();
    } catch (e) {
      state = MyState.error;
      notifyListeners();
    }
  }

  double getHappyPercentage() {
    if (listMoodDashboard.isEmpty) {
      return 0.0;
    }

    final happyMoodList = listMoodDashboard
        .where((mood) => mood.mood == MoodState.happy)
        .toList();

    if (happyMoodList.isEmpty) {
      return 0.0;
    }

    return (happyMoodList.length / listMoodDashboard.length) * 100;
  }

  String getSummaryLabel() {
    double happyPercentage = getHappyPercentage();

    if (happyPercentage <= 20) {
      return 'You\'re Sad';
    } else if (happyPercentage <= 40) {
      return 'You\'re Tired';
    } else if (happyPercentage <= 60) {
      return 'You\'re Neutral';
    } else if (happyPercentage <= 80) {
      return 'You\'re Happy';
    } else if (happyPercentage <= 100) {
      return 'You\'re Exited';
    }
    return '';
  }

  String getSummaryText() {
    double happyPercentage = getHappyPercentage();

    if (happyPercentage <= 20) {
      return 'Find someone that you love to talk.';
    } else if (happyPercentage <= 40) {
      return 'Take a deep breath, you can do it!';
    } else if (happyPercentage <= 60) {
      return 'Do something that will make you happier.';
    } else if (happyPercentage <= 80) {
      return 'Great Job! Keep it up.';
    } else if (happyPercentage <= 100) {
      return 'Excelent! Try to mantain your mood.';
    }
    return '';
  }
}
