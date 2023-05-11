import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:moodie/shared/themes/colors.dart';

class MoodEmoji extends StatelessWidget {
  final String location;
  final bool isSelected;

  const MoodEmoji({
    super.key,
    required this.location,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? ThemeColor.primary : ThemeColor.neutral_200,
      ),
      child: Lottie.asset(location, width: 60),
    );
  }
}
