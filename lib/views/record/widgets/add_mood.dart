import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/add_description_mood.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/mood_emoji.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddMood extends StatefulWidget {
  const AddMood({super.key});

  @override
  State<AddMood> createState() => _AddMoodState();
}

class _AddMoodState extends State<AddMood> {
  @override
  Widget build(BuildContext context) {
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
                    const Icon(Icons.keyboard_arrow_down),
                    Container(
                      margin: const EdgeInsets.only(
                        top: Spacing.spacing * 2,
                      ),
                      child: Column(
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
                                GestureDetector(
                                  onTap: () {},
                                  child: const MoodEmoji(
                                    location: AssetConst.cryingIcon,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const MoodEmoji(
                                    location: AssetConst.sadIcon,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const MoodEmoji(
                                    location: AssetConst.winkingIcon,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const MoodEmoji(
                                    location: AssetConst.blushingIcon,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const MoodEmoji(
                                    location: AssetConst.happyIcon,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const MoodEmoji(
                                    location: AssetConst.happyIcon,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: Spacing.spacing),
                          Text(
                            'Label Of Mood',
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
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: const BoxDecoration(
                                        color: ThemeColor.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              CustomRadius.defaultRadius * 2),
                                          topRight: Radius.circular(
                                              CustomRadius.defaultRadius * 2),
                                        ),
                                      ),
                                      child: const AddDescriptionMood(),
                                    );
                                  },
                                );
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
                      ),
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
