import 'package:damodi_daily_mood_diary/views/meditation/screen/forest_player.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/rain_player.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/wave_player.dart';
import 'package:flutter/material.dart';

class MeditationProvider extends ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const ForestPlayer(),
    const RainPlayer(),
    const WavePlayer(),
  ];

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
