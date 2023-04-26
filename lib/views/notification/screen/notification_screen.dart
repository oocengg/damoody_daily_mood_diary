import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: ThemeColor.primary,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  'Today\'s Notification',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                const NotificationCard(
                    title: 'How was your day ?',
                    desc:
                        'We hope you have a great day. Don\'t forget to fill your journal.',
                    time: '10:00 PM'),
                const SizedBox(height: Spacing.spacing * 2),
                const NotificationCard(
                    title: 'Good Morning! Have A Great Day.',
                    desc:
                        'Fill your journal to start and make wish for this day.',
                    time: '07:00 AM'),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  'Last Notification',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                const NotificationCard(
                    title: 'How was your day ?',
                    desc:
                        'We hope you have a great day. Don\'t forget to fill your journal.',
                    time: '10:00 PM'),
                const SizedBox(height: Spacing.spacing * 2),
                const NotificationCard(
                    title: 'Good Morning! Have A Great Day.',
                    desc:
                        'Fill your journal to start and make wish for this day.',
                    time: '07:00 AM'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
