import 'package:damodi_daily_mood_diary/utils/extensions/date_extension.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/provider/dashboard_provider.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/widgets/chart_summary_section.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/widgets/discover_section.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/widgets/motivation_section.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/widgets/page_header.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/widgets/recent_mood_section.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/widgets/text_summary_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    DashboardProvider;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context, listen: false);
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  image: provider.user?.photoURL ?? '',
                  name: provider.user?.displayName ?? '',
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Consumer<DashboardProvider>(builder: (context, provider, _) {
                  if (provider.state == MyState.loading) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(Spacing.spacing * 5),
                      decoration: BoxDecoration(
                        color: ThemeColor.white,
                        borderRadius:
                            BorderRadius.circular(CustomRadius.defaultRadius),
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
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: ThemeColor.primary,
                        ),
                      ),
                    );
                  } else {
                    return MotivationSection(
                        salutation: provider.getSalute(),
                        motivation: provider.quoteResponse?.content ??
                            'The only thing that will make you happy is being happy with who you are',
                        author:
                            provider.quoteResponse?.author ?? 'Goldie Hawn');
                  }
                }),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  'Recent Mood',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing),
                Consumer<DashboardProvider>(
                  builder: (context, provider, _) {
                    final latestMood = provider.getLatestMood();
                    if (provider.state == MyState.loading) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(Spacing.spacing * 6.5),
                        decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius:
                              BorderRadius.circular(CustomRadius.defaultRadius),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.9,
                              blurRadius: 10,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: ThemeColor.primary,
                          ),
                        ),
                      );
                    } else if (latestMood == null) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(Spacing.spacing * 6.5),
                        decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius:
                              BorderRadius.circular(CustomRadius.defaultRadius),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 0.9,
                              blurRadius: 10,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Mood is empty, write your mood right now!',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      return RecentMoodSection(
                        mood: latestMood.mood,
                        title: latestMood.title,
                        desc: latestMood.description,
                        moodLabel: latestMood.moodLabel,
                        createdAt: latestMood.createdAt.toHumanDateTime(),
                        index: provider.indexLatestMood,
                      );
                    }
                  },
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  'Summary',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing),
                Consumer<DashboardProvider>(
                  builder: (context, provider, _) {
                    final latestMood = provider.getLatestMood();
                    if (provider.state == MyState.loading) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ThemeColor.secondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(CustomRadius.defaultRadius),
                              ),
                            ),
                            height: 225,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(Spacing.spacing * 2),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: ThemeColor.background,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ThemeColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0.9,
                                  blurRadius: 10,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(CustomRadius.defaultRadius),
                              ),
                            ),
                            height: 225,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(Spacing.spacing * 2),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: ThemeColor.primary,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (latestMood == null) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ThemeColor.secondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(CustomRadius.defaultRadius),
                              ),
                            ),
                            height: 225,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(Spacing.spacing * 2),
                            child: const Center(
                              child: Text(
                                'Mood is empty, write your mood right now!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ThemeColor.background,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: ThemeColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0.9,
                                  blurRadius: 10,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(CustomRadius.defaultRadius),
                              ),
                            ),
                            height: 225,
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: const EdgeInsets.all(Spacing.spacing * 2),
                            child: const Center(
                              child: Text(
                                'Mood is empty, write your mood right now!',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ChartSummary(),
                          TextSummary(),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  'Discover',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing),
                const Discover(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
