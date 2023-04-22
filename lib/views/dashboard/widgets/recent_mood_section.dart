import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/constants/routes_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RecentMoodSection extends StatelessWidget {
  final String title, desc, tag, date, emoji;

  const RecentMoodSection({
    Key? key,
    required this.title,
    required this.desc,
    required this.tag,
    required this.date,
    required this.emoji,
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
              Navigator.pushNamed(context, Routes.recordPage);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    // color: ThemeColor.third,
                    borderRadius: BorderRadius.circular(
                      CustomRadius.defaultRadius,
                    ),
                  ),
                  child: LottieBuilder.asset(
                    emoji,
                  ),
                ),
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
                          maxLines: 2,
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
                            tag,
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
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: Spacing.spacing / 2),
                        Text(
                          date,
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
