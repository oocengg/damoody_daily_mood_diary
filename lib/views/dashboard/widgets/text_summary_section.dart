import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TextSummary extends StatelessWidget {
  final String title, content, date;
  final double chartValue;

  const TextSummary({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.chartValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Weekly mood right now :',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ThemeColor.primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You\'re Happy!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ThemeColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'Keep it up!',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: ThemeColor.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          Text(
            'Damoody',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ThemeColor.primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
