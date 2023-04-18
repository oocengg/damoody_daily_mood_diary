import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(
      fontSize: 48.sp, fontWeight: FontWeight.w700, color: Colors.white),
  displayMedium: GoogleFonts.poppins(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.poppins(fontSize: 46, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.poppins(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.poppins(
      fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
  titleSmall: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ThemeColor.primary,
    backgroundColor: Colors.white,
  ),
  bodySmall: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.poppins(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
