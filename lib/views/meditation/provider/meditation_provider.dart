import 'package:damodi_daily_mood_diary/views/meditation/provider/forest_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/rain_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/wave_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/forest_player.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/rain_player.dart';
import 'package:damodi_daily_mood_diary/views/meditation/screen/wave_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeditationProvider extends ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const ForestPlayer(),
    const RainPlayer(),
    const WavePlayer(),
  ];

  void setSelectedIndex(BuildContext context, int index) {
    selectedIndex = index;
    notifyListeners();

    if (selectedIndex == 0) {
      Provider.of<ForestProvider>(context, listen: false).initPlayer();
      Provider.of<RainProvider>(context, listen: false).stopPlayer();
      Provider.of<WaveProvider>(context, listen: false).stopPlayer();
    }
    if (selectedIndex == 1) {
      Provider.of<ForestProvider>(context, listen: false).stopPlayer();
      Provider.of<RainProvider>(context, listen: false).initPlayer();
      Provider.of<WaveProvider>(context, listen: false).stopPlayer();
    }
    if (selectedIndex == 2) {
      Provider.of<ForestProvider>(context, listen: false).stopPlayer();
      Provider.of<RainProvider>(context, listen: false).stopPlayer();
      Provider.of<WaveProvider>(context, listen: false).initPlayer();
    }
  }
}
