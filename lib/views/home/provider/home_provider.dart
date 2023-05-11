import 'package:damodi_daily_mood_diary/views/dashboard/provider/dashboard_provider.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/screen/dashboard_screen.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/forest_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/meditation_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/rain_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/wave_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/meditation_screen.dart';
import 'package:damodi_daily_mood_diary/views/notification/provider/notification_provider.dart';
import 'package:damodi_daily_mood_diary/views/notification/screen/notification_screen.dart';
import 'package:damodi_daily_mood_diary/views/profile/provider/profile_provider.dart';
import 'package:damodi_daily_mood_diary/views/profile/screen/profile_screen.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/screen/record_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeProvider with ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardScreen(),
    const RecordScreen(),
    const MeditationScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  void setSelectedIndex(BuildContext context, int index) {
    selectedIndex = index;

    if (selectedIndex == 0) {
      Provider.of<DashboardProvider>(context, listen: false).getMoodByWeek();
      Provider.of<DashboardProvider>(context, listen: false).getQuote();
      Provider.of<ForestProvider>(context, listen: false).stopPlayer();
      Provider.of<RainProvider>(context, listen: false).stopPlayer();
      Provider.of<WaveProvider>(context, listen: false).stopPlayer();
    }

    if (selectedIndex == 1) {
      Provider.of<RecordProvider>(context, listen: false).selectedDate =
          DateTime.now();
      Provider.of<RecordProvider>(context, listen: false).getMoodByDate();
      Provider.of<ForestProvider>(context, listen: false).stopPlayer();
      Provider.of<RainProvider>(context, listen: false).stopPlayer();
      Provider.of<WaveProvider>(context, listen: false).stopPlayer();
    }

    if (selectedIndex == 2) {
      Provider.of<MeditationProvider>(context, listen: false)
          .setSelectedIndex(context, 0);
      Provider.of<ForestProvider>(context, listen: false).initPlayer();
      Provider.of<RainProvider>(context, listen: false).initPlayer();
      Provider.of<WaveProvider>(context, listen: false).initPlayer();
    }

    if (selectedIndex == 3) {
      Provider.of<NotificationProvider>(context, listen: false)
          .getNotificationByWeek();
      Provider.of<ForestProvider>(context, listen: false).stopPlayer();
      Provider.of<RainProvider>(context, listen: false).stopPlayer();
      Provider.of<WaveProvider>(context, listen: false).stopPlayer();
    }

    if (selectedIndex == 4) {
      Provider.of<ProfileProvider>(context, listen: false)
          .getDataCountByUserId();
      Provider.of<ForestProvider>(context, listen: false).stopPlayer();
      Provider.of<RainProvider>(context, listen: false).stopPlayer();
      Provider.of<WaveProvider>(context, listen: false).stopPlayer();
    }

    notifyListeners();
  }
}
