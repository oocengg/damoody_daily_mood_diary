import 'package:damodi_daily_mood_diary/services/notification_service.dart';
import 'package:damodi_daily_mood_diary/utils/extensions/date_extension.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/notification/provider/notification_provider.dart';
import 'package:damodi_daily_mood_diary/views/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.spacing * 5,
              horizontal: Spacing.spacing * 3,
            ),
            child: Builder(builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Notification',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: ThemeColor.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await provider.addNotification();
                        },
                        // onTap: () => provider.getMoodByDate(),
                        child: const Icon(
                          Icons.notifications,
                          color: ThemeColor.primary,
                        ),
                      )
                    ],
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
                  Consumer<NotificationProvider>(
                      builder: (context, provider, _) {
                    return Column(
                      children: [
                        const SizedBox(height: Spacing.spacing * 3),
                        if (provider.state == MyState.loading) ...[
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ] else if (provider.state == MyState.success &&
                            provider.listTodayNotification.isNotEmpty) ...[
                          ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.listTodayNotification.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  NotificationCard(
                                    index: index,
                                    day: true,
                                  ),
                                  const SizedBox(
                                    height: Spacing.spacing,
                                  ),
                                ],
                              );
                            },
                          )
                        ] else if (provider.state == MyState.error) ...[
                          const Center(
                            child: Text('Oops! Something went error.'),
                          ),
                        ] else if (provider.listTodayNotification.isEmpty &&
                            provider.state == MyState.success) ...[
                          const Center(
                            child: Text('Mood record is empty.'),
                          ),
                        ],
                        const SizedBox(height: Spacing.spacing * 3),
                      ],
                    );
                  }),
                  Text(
                    'Older Notification',
                    style: GoogleFonts.poppins(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ThemeColor.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  Consumer<NotificationProvider>(
                      builder: (context, provider, _) {
                    return Column(
                      children: [
                        const SizedBox(height: Spacing.spacing * 3),
                        if (provider.state == MyState.loading) ...[
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ] else if (provider.state == MyState.success &&
                            provider.listOlderNotification.isNotEmpty) ...[
                          ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.listOlderNotification.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  NotificationCard(
                                    index: index,
                                    day: true,
                                  ),
                                  const SizedBox(
                                    height: Spacing.spacing,
                                  ),
                                ],
                              );
                            },
                          )
                        ] else if (provider.state == MyState.error) ...[
                          const Center(
                            child: Text('Oops! Something went error.'),
                          ),
                        ] else if (provider.listOlderNotification.isEmpty &&
                            provider.state == MyState.success) ...[
                          const Center(
                            child: Text('Mood record is empty.'),
                          ),
                        ],
                        const SizedBox(height: Spacing.spacing * 3),
                      ],
                    );
                  }),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
