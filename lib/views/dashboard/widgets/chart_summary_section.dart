import 'package:damodi_daily_mood_diary/utils/extensions/date_extension.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ChartSummary extends StatelessWidget {
  const ChartSummary({super.key});

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
                'Weekly Happy Mood',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ThemeColor.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
          Consumer<DashboardProvider>(
            builder: (context, provider, _) {
              return Visibility(
                visible: true,
                child: SizedBox(
                  height: Spacing.spacing * 16,
                  child: CircularPercentIndicator(
                      radius: Spacing.spacing * 8,
                      lineWidth: Spacing.spacing,
                      animation: true,
                      percent: provider.getHappyPercentage() / 100,
                      center: Text(
                        'Happinesse : ${(provider.getHappyPercentage()).toStringAsFixed(2)}%',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: ThemeColor.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: ThemeColor.primary,
                      backgroundWidth: Spacing.spacing / 2,
                      progressColor: ThemeColor.white),
                ),
              );
            },
          ),
          Text(
            DateTime.now().toHumanDateShort(),
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
