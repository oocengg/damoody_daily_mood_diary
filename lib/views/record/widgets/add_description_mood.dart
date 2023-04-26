import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDescriptionMood extends StatefulWidget {
  const AddDescriptionMood({Key? key}) : super(key: key);

  @override
  State<AddDescriptionMood> createState() => _AddDescriptionMoodState();
}

class _AddDescriptionMoodState extends State<AddDescriptionMood> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(Spacing.spacing * 3),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ThemeColor.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(CustomRadius.defaultRadius),
                      topRight: Radius.circular(CustomRadius.defaultRadius),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: Spacing.spacing * 2),
                        const Icon(Icons.keyboard_arrow_down),
                        Container(
                          margin: const EdgeInsets.only(
                            top: Spacing.spacing * 2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mood Title',
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: ThemeColor.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              const SizedBox(
                                height: Spacing.spacing,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(20),
                                  fillColor: ThemeColor.neutral_200,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: 'Title',
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ThemeColor.neutral_500,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: Spacing.spacing * 3),
                              Text(
                                'Describe your mood :',
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: ThemeColor.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              const SizedBox(height: Spacing.spacing),
                              TextFormField(
                                maxLines: 10,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(20),
                                  fillColor: ThemeColor.neutral_200,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: 'How you feel?',
                                  hintStyle: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ThemeColor.neutral_500,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: Spacing.spacing * 3),
                              Text(
                                'Choose an image',
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: ThemeColor.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                              const SizedBox(height: Spacing.spacing),
                              Container(
                                padding: const EdgeInsets.all(Spacing.spacing),
                                width: double.infinity,
                                height: 65,
                                decoration: BoxDecoration(
                                  color: ThemeColor.secondary,
                                  borderRadius: BorderRadius.circular(
                                    CustomRadius.defaultRadius,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Choose photo from your files",
                                        style: GoogleFonts.poppins(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: ThemeColor.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          '|',
                                          style: TextStyle(
                                              color: ThemeColor.white,
                                              fontSize: 30),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Icon(
                                            CustomIcon.camera,
                                            color: ThemeColor.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 155),
                              SizedBox(
                                width: double.infinity,
                                height: 45,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: ThemeColor.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          CustomRadius.defaultRadius),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Submit",
                                    style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: ThemeColor.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
