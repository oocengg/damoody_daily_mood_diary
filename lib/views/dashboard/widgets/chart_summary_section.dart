import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ChartSummary extends StatelessWidget {
  final String title, content, date;
  final double chartValue;

  const ChartSummary({
    Key? key,
    required this.title,
    required this.content,
    required this.date,
    required this.chartValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ThemeColor.secondary,
        borderRadius: BorderRadius.all(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ThemeColor.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          Visibility(
            visible: true,
            child: SizedBox(
              height: Spacing.spacing * 16,
              child: CircularPercentIndicator(
                  radius: Spacing.spacing * 8,
                  lineWidth: Spacing.spacing,
                  animation: true,
                  percent: chartValue / 100,
                  center: Text(
                    content,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ThemeColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: ThemeColor.background,
                  backgroundWidth: Spacing.spacing / 2,
                  progressColor: ThemeColor.white),
            ),
          ),
          Text(
            date,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ThemeColor.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
