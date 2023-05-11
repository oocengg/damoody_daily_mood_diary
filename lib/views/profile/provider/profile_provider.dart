import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/services/firebase_service.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileProvider extends ChangeNotifier {
  MyState state = MyState.none;

  User? user = FirebaseAuth.instance.currentUser;

  int countMood = 0;

  FirebaseService recordService = FirebaseService();

  ProfileProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      this.user = user;
      notifyListeners();
    });
    getDataCountByUserId();
  }

  CollectionReference moodRecord =
      FirebaseFirestore.instance.collection('mood_record');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> logoutFromGoogle() async {
    state = MyState.loading;
    notifyListeners();

    await _auth.signOut();
    await _googleSignIn.signOut();

    await Future.delayed(const Duration(seconds: 2));

    state = MyState.success;
    notifyListeners();
  }

  Future<void> getDataCountByUserId() async {
    // state = MyState.loading;
    // notifyListeners();

    try {
      final countMoodFirebase = await recordService.getDataCountByUserId(user);

      countMood = countMoodFirebase;
      state = MyState.success;
      notifyListeners();
    } catch (e) {
      state = MyState.error;
      notifyListeners();
    }
  }
}
