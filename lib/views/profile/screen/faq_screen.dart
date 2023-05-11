import 'package:damodi_daily_mood_diary/utils/constants/faq_text_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.spacing * 5,
              horizontal: Spacing.spacing * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CustomIcon.leftOpen),
                ),
                Text(
                  'Frequently Ask Question (FAQ)',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: ThemeColor.primary,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  FaqText.desc1,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),

                // Q1
                Text(
                  FaqText.q1,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing * 2),
                      width: Spacing.spacing * 1.5,
                      height: Spacing.spacing * 1.5,
                      decoration: const BoxDecoration(
                        color: ThemeColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomRadius.defaultRadius),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing,
                    ),
                    Expanded(
                      child: Text(
                        FaqText.aq1,
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),

                // Q2
                Text(
                  FaqText.q2,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing * 2),
                      width: Spacing.spacing * 1.5,
                      height: Spacing.spacing * 1.5,
                      decoration: const BoxDecoration(
                        color: ThemeColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomRadius.defaultRadius),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing,
                    ),
                    Expanded(
                      child: Text(
                        FaqText.aq2,
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),

                // Q3
                Text(
                  FaqText.q3,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing * 2),
                      width: Spacing.spacing * 1.5,
                      height: Spacing.spacing * 1.5,
                      decoration: const BoxDecoration(
                        color: ThemeColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomRadius.defaultRadius),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing,
                    ),
                    Expanded(
                      child: Text(
                        FaqText.aq3,
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),

                // Q4
                Text(
                  FaqText.q4,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing * 2),
                      width: Spacing.spacing * 1.5,
                      height: Spacing.spacing * 1.5,
                      decoration: const BoxDecoration(
                        color: ThemeColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomRadius.defaultRadius),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing,
                    ),
                    Expanded(
                      child: Text(
                        FaqText.aq4,
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),

                // Q5
                Text(
                  FaqText.q5,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing * 2),
                      width: Spacing.spacing * 1.5,
                      height: Spacing.spacing * 1.5,
                      decoration: const BoxDecoration(
                        color: ThemeColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomRadius.defaultRadius),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing,
                    ),
                    Expanded(
                      child: Text(
                        FaqText.aq5,
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),

                // Q6
                Text(
                  FaqText.q6,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing * 2),
                      width: Spacing.spacing * 1.5,
                      height: Spacing.spacing * 1.5,
                      decoration: const BoxDecoration(
                        color: ThemeColor.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(CustomRadius.defaultRadius),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing,
                    ),
                    Expanded(
                      child: Text(
                        FaqText.aq6,
                        style: GoogleFonts.poppins(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ThemeColor.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),

                //D2
                Text(
                  FaqText.desc2,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
