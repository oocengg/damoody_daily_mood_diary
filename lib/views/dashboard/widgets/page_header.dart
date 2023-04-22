import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeader extends StatelessWidget {
  final String image, name;

  const PageHeader({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ThemeColor.black,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              Text(
                name,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ThemeColor.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(CustomRadius.defaultRadius),
          child: Image.network(
            image,
            width: Spacing.spacing * 6,
            height: Spacing.spacing * 6,
          ),
        ),
      ],
    );
  }
}
