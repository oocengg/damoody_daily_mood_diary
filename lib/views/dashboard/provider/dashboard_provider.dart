import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  MyState state = MyState.none;

  User? user = FirebaseAuth.instance.currentUser;

  DashboardProvider() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      this.user = user;
      notifyListeners();
    });
  }
}
