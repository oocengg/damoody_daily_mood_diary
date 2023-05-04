import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/utils/widgets/custom_alert.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/add_description_mood.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/mood_emoji.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddMood extends StatefulWidget {
  const AddMood({super.key});

  @override
  State<AddMood> createState() => _AddMoodState();
}

class _AddMoodState extends State<AddMood> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecordProvider>(context, listen: false);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: Spacing.spacing,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(Spacing.spacing * 2),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: ThemeColor.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(CustomRadius.defaultRadius),
                  topRight: Radius.circular(CustomRadius.defaultRadius),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: Spacing.spacing * 2),
                    InkWell(
                      onTap: () {
                        provider.setMood(MoodState.none);
                        provider.setMoodLabel(MoodState.none);
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.keyboard_arrow_down),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Spacing.spacing * 2,
                      ),
                      child: Consumer<RecordProvider>(
                          builder: (context, provider, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Pick your mood right now',
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: ThemeColor.neutral_900,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            const SizedBox(height: Spacing.spacing * 2),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: Spacing.spacing,
                              ),
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.0,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  // Sad Emoji
                                  GestureDetector(
                                    onTap: () {
                                      if (provider.mood == MoodState.sad) {
                                        provider.setMood(MoodState.none);
                                        provider.setMoodLabel(MoodState.none);
                                      } else {
                                        provider.setMood(MoodState.sad);
                                        provider.setMoodLabel(MoodState.sad);
                                      }
                                    },
                                    child: MoodEmoji(
                                      location: AssetConst.cryingIcon,
                                      isSelected:
                                          provider.mood == MoodState.sad,
                                    ),
                                  ),

                                  // Tired Emoji
                                  GestureDetector(
                                    onTap: () {
                                      if (provider.mood == MoodState.tired) {
                                        provider.setMood(MoodState.none);
                                        provider.setMoodLabel(MoodState.none);
                                      } else {
                                        provider.setMood(MoodState.tired);
                                        provider.setMoodLabel(MoodState.tired);
                                      }
                                    },
                                    child: MoodEmoji(
                                      location: AssetConst.sadIcon,
                                      isSelected:
                                          provider.mood == MoodState.tired,
                                    ),
                                  ),

                                  // Neutral Emoji
                                  GestureDetector(
                                    onTap: () {
                                      if (provider.mood == MoodState.neutral) {
                                        provider.setMood(MoodState.none);
                                        provider.setMoodLabel(MoodState.none);
                                      } else {
                                        provider.setMood(MoodState.neutral);
                                        provider
                                            .setMoodLabel(MoodState.neutral);
                                      }
                                    },
                                    child: MoodEmoji(
                                      location: AssetConst.neutralIcon,
                                      isSelected:
                                          provider.mood == MoodState.neutral,
                                    ),
                                  ),

                                  // Exited Emoji
                                  GestureDetector(
                                    onTap: () {
                                      if (provider.mood == MoodState.excited) {
                                        provider.setMood(MoodState.none);
                                        provider.setMoodLabel(MoodState.none);
                                      } else {
                                        provider.setMood(MoodState.excited);
                                        provider
                                            .setMoodLabel(MoodState.excited);
                                      }
                                    },
                                    child: MoodEmoji(
                                      location: AssetConst.winkingIcon,
                                      isSelected:
                                          provider.mood == MoodState.excited,
                                    ),
                                  ),

                                  // Cheerful Emoji
                                  GestureDetector(
                                    onTap: () {
                                      if (provider.mood == MoodState.cheerful) {
                                        provider.setMood(MoodState.none);
                                        provider.setMoodLabel(MoodState.none);
                                      } else {
                                        provider.setMood(MoodState.cheerful);
                                        provider
                                            .setMoodLabel(MoodState.cheerful);
                                      }
                                    },
                                    child: MoodEmoji(
                                      location: AssetConst.blushingIcon,
                                      isSelected:
                                          provider.mood == MoodState.cheerful,
                                    ),
                                  ),

                                  // Happy Emoji
                                  GestureDetector(
                                    onTap: () {
                                      if (provider.mood == MoodState.happy) {
                                        provider.setMood(MoodState.none);
                                        provider.setMoodLabel(MoodState.none);
                                      } else {
                                        provider.setMood(MoodState.happy);
                                        provider.setMoodLabel(MoodState.happy);
                                      }
                                    },
                                    child: MoodEmoji(
                                      location: AssetConst.happyIcon,
                                      isSelected:
                                          provider.mood == MoodState.happy,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: Spacing.spacing),
                            Text(
                              provider.moodLabel == 'Select Your Mood'
                                  ? provider.moodLabel
                                  : 'You\'re ${provider.moodLabel}',
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: ThemeColor.neutral_900,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            const SizedBox(height: Spacing.spacing),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: ThemeColor.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        CustomRadius.defaultRadius),
                                  ),
                                ),
                                onPressed: () {
                                  if (provider.mood == MoodState.none) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Error! Please Select your mood!'),
                                        backgroundColor: ThemeColor.error_400,
                                      ),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              CustomRadius.defaultRadius * 2),
                                          topRight: Radius.circular(
                                              CustomRadius.defaultRadius * 2),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            color: ThemeColor.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  CustomRadius.defaultRadius *
                                                      2),
                                              topRight: Radius.circular(
                                                  CustomRadius.defaultRadius *
                                                      2),
                                            ),
                                          ),
                                          child: const AddDescriptionMood(),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  "Next",
                                  style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ThemeColor.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
