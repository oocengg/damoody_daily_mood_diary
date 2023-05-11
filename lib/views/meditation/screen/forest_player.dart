import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/forest_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForestPlayer extends StatefulWidget {
  const ForestPlayer({super.key});

  @override
  State<ForestPlayer> createState() => _ForestPlayerState();
}

class _ForestPlayerState extends State<ForestPlayer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: Spacing.spacing * 5,
          left: Spacing.spacing * 3,
          right: Spacing.spacing * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meditation',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ThemeColor.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: Spacing.spacing * 2),
            Text(
              'Hear this song, and let your body, your mind, and your soul to be relax.',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ThemeColor.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(height: Spacing.spacing * 3),
            Consumer<ForestProvider>(
              builder: (context, provider, _) {
                return Center(
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.9,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(AssetConst.forestSq),
                      ),
                      const SizedBox(
                        height: Spacing.spacing / 2,
                      ),
                      const Text(
                        'Forest - Peder B. Helland',
                        style: TextStyle(
                          color: ThemeColor.background,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(provider.value / 60).floor()} : ${(provider.value % 60).floor()}',
                            style: const TextStyle(
                              color: ThemeColor.background,
                            ),
                          ),
                          Slider.adaptive(
                            min: 0.0,
                            max: provider.duration!.inSeconds.toDouble(),
                            value: provider.value,
                            onChanged: (value) {
                              provider.setSliderValue(value);
                              provider.player
                                  .seek(Duration(seconds: value.toInt()));
                            },
                            activeColor: ThemeColor.background,
                          ),
                          Text(
                            '${provider.duration!.inMinutes} : ${provider.duration!.inSeconds % 60}',
                            style: const TextStyle(
                              color: ThemeColor.background,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Colors.transparent,
                          border: Border.all(
                            color: ThemeColor.background,
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            provider.playPause();
                          },
                          child: Icon(
                            provider.isPlaying ? Icons.pause : Icons.play_arrow,
                            color: ThemeColor.background,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
