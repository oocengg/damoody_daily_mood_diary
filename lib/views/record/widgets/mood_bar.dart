import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/constants/routes_const.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/screen/detail_mood_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MoodBar extends StatelessWidget {
  final String title, desc, moodLabel, createdAt;
  final MoodState mood;
  final int index;

  const MoodBar({
    Key? key,
    required this.title,
    required this.desc,
    required this.moodLabel,
    required this.createdAt,
    required this.mood,
    required this.index,
    // required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.spacing * 2),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(CustomRadius.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.9,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailMood(
                          index: this.index,
                        )),
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.all(Spacing.spacing * 3),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(CustomRadius.defaultRadius),
                    ),
                    content: Consumer<RecordProvider>(
                      builder: (context, provider, _) {
                        if (provider.state == MyState.loading) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Column(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      Icons.warning,
                                      size: 50,
                                      color: ThemeColor.warning_400,
                                    ),
                                  ),
                                  const SizedBox(height: Spacing.spacing),
                                  Text(
                                    "Delete Mood",
                                    style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: ThemeColor.neutral_600,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: Spacing.spacing),
                                  Text(
                                    "Are you sure you want to delete this mood?",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: ThemeColor.neutral_600,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(height: Spacing.spacing),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                            color: ThemeColor.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(
                                            color: ThemeColor.error_400,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () async {
                                          final moodModel =
                                              provider.listMood[index];
                                          await provider.deleteMood(moodModel);

                                          if (context.mounted) {
                                            Navigator.of(context).pop();
                                            provider.getMoodByDate();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    "Mood deleted successfully"),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                      },
                    ),
                  );
                },
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (mood == MoodState.happy) ...[
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      // color: ThemeColor.third,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: LottieBuilder.asset(AssetConst.happyIcon),
                  ),
                ] else if (mood == MoodState.cheerful) ...[
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      // color: ThemeColor.third,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: LottieBuilder.asset(AssetConst.blushingIcon),
                  ),
                ] else if (mood == MoodState.excited) ...[
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      // color: ThemeColor.third,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: LottieBuilder.asset(AssetConst.winkingIcon),
                  ),
                ] else if (mood == MoodState.neutral) ...[
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      // color: ThemeColor.third,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: LottieBuilder.asset(AssetConst.neutralIcon),
                  ),
                ] else if (mood == MoodState.tired) ...[
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      // color: ThemeColor.third,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: LottieBuilder.asset(AssetConst.sadIcon),
                  ),
                ] else if (mood == MoodState.sad) ...[
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      // color: ThemeColor.third,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: LottieBuilder.asset(AssetConst.cryingIcon),
                  ),
                ],
                const SizedBox(
                  width: Spacing.spacing,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: ThemeColor.neutral_600,
                                    ),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Spacing.spacing / 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ThemeColor.primary, width: 1),
                            borderRadius: BorderRadius.circular(
                              CustomRadius.defaultRadius,
                            ),
                          ),
                          child: Text(
                            moodLabel,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ThemeColor.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                        const SizedBox(height: Spacing.spacing / 2),
                        Text(
                          desc,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ThemeColor.neutral_500,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Spacing.spacing / 2),
                        Text(
                          createdAt,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: ThemeColor.neutral_400,
                                  ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.recordPage);
              },
              child: const Icon(
                CustomIcon.rightOpen,
                color: ThemeColor.neutral_400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
