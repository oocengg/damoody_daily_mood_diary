import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ForestProvider extends ChangeNotifier {
  final player = AudioPlayer();
  bool isPlaying = false;
  double value = 0;

  Duration? duration = const Duration(seconds: 0);
  StreamSubscription<Duration>? positionSubscription;

  ForestProvider() {
    initPlayer();
  }

  void initPlayer() async {
    await player.setSource(AssetSource('music/forest.mp3'));
    duration = await player.getDuration();
  }

  void playPause() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.resume();

      player.onPositionChanged.listen((position) {
        value = position.inSeconds.toDouble();
        notifyListeners();
      });
    }
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void setSliderValue(double value) {
    this.value = value;
    notifyListeners();
  }

  void stopPlayer() async {
    await player.stop();
    isPlaying = false;
    value = 0;
    notifyListeners();
  }
}
