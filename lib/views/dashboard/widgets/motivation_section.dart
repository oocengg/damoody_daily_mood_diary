import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MotivationSection extends StatelessWidget {
  final String salutation, motivation, author;

  const MotivationSection({
    Key? key,
    required this.salutation,
    required this.motivation,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.spacing * 2),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(CustomRadius.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.9,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                salutation,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ThemeColor.primary, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'How Are you?',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ThemeColor.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.spacing),
          Text(
            '"$motivation"',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ThemeColor.neutral_500,
                    fontSize: 13,
                  ),
            ),
          ),
          const SizedBox(height: Spacing.spacing),
          Text(
            author,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ThemeColor.neutral_500,
                ),
          ),
        ],
      ),
    );
  }
}
