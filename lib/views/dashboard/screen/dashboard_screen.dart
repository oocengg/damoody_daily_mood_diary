import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
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
                const MotivationSection(
                    salutation: 'Good Morning, ',
                    motivation:
                        'Most folks are as happy as they make up their minds to be.',
                    author: 'Abraham Lincoln'),
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
                const RecentMoodSection(
                  title: 'Title',
                  desc:
                      'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  tag: 'Relaxed',
                  date: '12 - Okt - 2023',
                  emoji: AssetConst.happyIcon,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ChartSummary(
                      title: 'Weekly Mood',
                      content: 'Happy',
                      date: '22 - Okt - 2023',
                      chartValue: 49,
                    ),
                    TextSummary(
                      title: 'Weekly Mood',
                      content: 'Happy',
                      date: '22 - Okt - 2023',
                      chartValue: 49,
                    ),
                  ],
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
