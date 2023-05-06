import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/provider/dashboard_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/screen/edit_mood_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DetailMoodDashboard extends StatelessWidget {
  final int index;

  const DetailMoodDashboard({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context, listen: true);
    if (provider.listMoodDashboard.isEmpty) {
      return const SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColor.background,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      final mood = provider.listMoodDashboard[index];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          provider.getMoodByWeek();
                        },
                        icon: const Icon(CustomIcon.leftOpen),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditMoodScreen(
                                      index: index,
                                    )),
                          );
                        },
                        icon: const Icon(Icons.edit_outlined),
                      ),
                    ],
                  ),
                  Text(
                    mood.title,
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: ThemeColor.primary,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  // const SizedBox(height: Spacing.spacing * 3),
                  if (mood.mood == MoodState.happy) ...[
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius,
                          ),
                        ),
                        child: LottieBuilder.asset(AssetConst.happyIcon),
                      ),
                    ),
                  ] else if (mood.mood == MoodState.cheerful) ...[
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius,
                          ),
                        ),
                        child: LottieBuilder.asset(AssetConst.blushingIcon),
                      ),
                    ),
                  ] else if (mood.mood == MoodState.excited) ...[
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius,
                          ),
                        ),
                        child: LottieBuilder.asset(AssetConst.winkingIcon),
                      ),
                    ),
                  ] else if (mood.mood == MoodState.neutral) ...[
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius,
                          ),
                        ),
                        child: LottieBuilder.asset(AssetConst.neutralIcon),
                      ),
                    ),
                  ] else if (mood.mood == MoodState.tired) ...[
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius,
                          ),
                        ),
                        child: LottieBuilder.asset(AssetConst.sadIcon),
                      ),
                    ),
                  ] else if (mood.mood == MoodState.sad) ...[
                    Center(
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius,
                          ),
                        ),
                        child: LottieBuilder.asset(AssetConst.cryingIcon),
                      ),
                    ),
                  ],
                  Text(
                    mood.description,
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ThemeColor.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  const SizedBox(height: Spacing.spacing * 3),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      mood.imageUrl,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(Spacing.spacing),
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
