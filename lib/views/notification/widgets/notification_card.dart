import 'package:damodi_daily_mood_diary/utils/extensions/date_extension.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/notification/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationCard extends StatelessWidget {
  final int index;
  final bool day;

  const NotificationCard({
    Key? key,
    required this.index,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context, listen: false);
    final notif = provider.listTodayNotification[index];
    final olderNotif = provider.listTodayNotification[index];

    if (day == true) {
      return InkWell(
        onTap: () async {
          await provider.updateNotification(notif);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<NotificationProvider>(
              builder: (context, provider, _) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: Spacing.spacing * 2),
                  width: Spacing.spacing * 1.5,
                  height: Spacing.spacing * 1.5,
                  decoration: BoxDecoration(
                    color:
                        provider.listTodayNotification[index].isActive == true
                            ? ThemeColor.secondary
                            : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(CustomRadius.defaultRadius),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: Spacing.spacing * 2),
            Expanded(
              child: AnimatedSize(
                alignment: Alignment.topLeft,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notif.title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ThemeColor.neutral_900,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: Spacing.spacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            notif.description,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ThemeColor.neutral_500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: Spacing.spacing * 2),
            Text(
              notif.createdAt.toHumanTime(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ThemeColor.neutral_900,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      );
    } else {
      return InkWell(
        onTap: () async {
          await provider.updateNotification(notif);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Consumer<NotificationProvider>(
              builder: (context, provider, _) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: Spacing.spacing * 2),
                  width: Spacing.spacing * 1.5,
                  height: Spacing.spacing * 1.5,
                  decoration: BoxDecoration(
                    color:
                        provider.listOlderNotification[index].isActive == true
                            ? ThemeColor.secondary
                            : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(CustomRadius.defaultRadius),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: Spacing.spacing * 2),
            Expanded(
              child: AnimatedSize(
                alignment: Alignment.topLeft,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      olderNotif.title,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ThemeColor.neutral_900,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: Spacing.spacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            olderNotif.description,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ThemeColor.neutral_500,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: Spacing.spacing * 2),
            Text(
              notif.createdAt.toHumanTime(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ThemeColor.neutral_900,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      );
    }
  }
}
