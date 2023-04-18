import 'package:damodi_daily_mood_diary/views/dashboard/screen/dashboard_screen.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/meditation_screen.dart';
import 'package:damodi_daily_mood_diary/views/notification/screen/notification_screen.dart';
import 'package:damodi_daily_mood_diary/views/profile/screen/profile_screen.dart';
import 'package:damodi_daily_mood_diary/views/record/screen/record_screen.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardScreen(),
    const RecordScreen(),
    const MeditationScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
