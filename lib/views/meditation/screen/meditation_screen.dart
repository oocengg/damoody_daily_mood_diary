import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/meditation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MeditationProvider>(
      builder: (context, provider, child) {
        return Stack(
          children: [
            Image.asset(
              provider.selectedIndex == 0
                  ? AssetConst.forestImg
                  : provider.selectedIndex == 1
                      ? AssetConst.rainImg
                      : AssetConst.waveImg,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(child: provider.pages[provider.selectedIndex]),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing,
                  vertical: Spacing.spacing,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        provider.setSelectedIndex(0);
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing,
                          vertical: Spacing.spacing + 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius * 10,
                          ),
                          color: provider.selectedIndex == 0
                              ? Colors.green
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Forest',
                            style: TextStyle(
                              color: provider.selectedIndex == 0
                                  ? Colors.white
                                  : ThemeColor.neutral_500,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.setSelectedIndex(1);
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing,
                          vertical: Spacing.spacing + 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius * 10,
                          ),
                          color: provider.selectedIndex == 1
                              ? ThemeColor.primary
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Rain',
                            style: TextStyle(
                              color: provider.selectedIndex == 1
                                  ? Colors.white
                                  : ThemeColor.neutral_500,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        provider.setSelectedIndex(2);
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing,
                          vertical: Spacing.spacing + 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius * 10,
                          ),
                          color: provider.selectedIndex == 2
                              ? Colors.teal
                              : Colors.transparent,
                        ),
                        child: Center(
                          child: Text(
                            'Wave',
                            style: TextStyle(
                              color: provider.selectedIndex == 2
                                  ? Colors.white
                                  : ThemeColor.neutral_500,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
