import 'package:damodi_daily_mood_diary/utils/constants/article_text_const.dart';
import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

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
                  ArticleText.title,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: ThemeColor.primary,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: ThemeColor.secondary,
                      borderRadius: BorderRadius.circular(
                        CustomRadius.defaultRadius,
                      ),
                    ),
                    child: Image.asset(AssetConst.articleImage),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  ArticleText.p1,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  ArticleText.p2,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  ArticleText.p3,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  ArticleText.p4,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  ArticleText.p5,
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
