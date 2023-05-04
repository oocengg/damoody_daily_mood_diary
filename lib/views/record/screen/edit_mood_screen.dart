import 'dart:io';

import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/image_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/mood_emoji.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditMoodScreen extends StatefulWidget {
  final int index;

  const EditMoodScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<EditMoodScreen> createState() => _EditMoodScreenState();
}

class _EditMoodScreenState extends State<EditMoodScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecordProvider>(context, listen: false);
    final mood = provider.listMood[widget.index];
    final _formKey = GlobalKey<FormState>();
    final int index = widget.index;
    TextEditingController titleController =
        TextEditingController(text: mood.title);
    TextEditingController descController =
        TextEditingController(text: mood.description);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.spacing * 5,
            horizontal: Spacing.spacing * 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  titleController.clear();
                  descController.clear();
                  provider.selectedImage = ImageState.none;
                  provider.mood = MoodState.none;
                  provider.selectedImage = ImageState.none;
                  provider.image = null;
                  provider.moodLabel = 'Select Your Mood';
                  provider.getMoodByDate();
                },
                icon: const Icon(CustomIcon.leftOpen),
              ),
              Text(
                'Edit Your Record',
                style: GoogleFonts.poppins(
                  textStyle:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: ThemeColor.primary,
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: Spacing.spacing * 2),
                      Container(
                        margin: const EdgeInsets.only(
                          top: Spacing.spacing * 2,
                        ),
                        child: Consumer<RecordProvider>(
                            builder: (context, provider, _) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Pick your mood right now',
                                  style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: ThemeColor.neutral_900,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: Spacing.spacing * 2),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Spacing.spacing,
                                  ),
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1.0,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      // Sad Emoji
                                      GestureDetector(
                                        onTap: () {
                                          if (mood.mood == MoodState.sad &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood == MoodState.sad) {
                                            provider.setMood(MoodState.none);
                                            provider
                                                .setMoodLabel(MoodState.none);
                                          } else {
                                            provider.setMood(MoodState.sad);
                                            provider
                                                .setMoodLabel(MoodState.sad);
                                          }
                                        },
                                        child: MoodEmoji(
                                          location: AssetConst.cryingIcon,
                                          isSelected: mood.mood ==
                                                      MoodState.sad &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood == MoodState.sad,
                                        ),
                                      ),

                                      // Tired Emoji
                                      GestureDetector(
                                        onTap: () {
                                          if (mood.mood == MoodState.tired &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood ==
                                                  MoodState.tired) {
                                            provider.setMood(MoodState.none);
                                            provider
                                                .setMoodLabel(MoodState.none);
                                          } else {
                                            provider.setMood(MoodState.tired);
                                            provider
                                                .setMoodLabel(MoodState.tired);
                                          }
                                        },
                                        child: MoodEmoji(
                                          location: AssetConst.sadIcon,
                                          isSelected: mood.mood ==
                                                      MoodState.tired &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood == MoodState.tired,
                                        ),
                                      ),

                                      // Neutral Emoji
                                      GestureDetector(
                                        onTap: () {
                                          if (mood.mood == MoodState.neutral &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood ==
                                                  MoodState.neutral) {
                                            provider.setMood(MoodState.none);
                                            provider
                                                .setMoodLabel(MoodState.none);
                                          } else {
                                            provider.setMood(MoodState.neutral);
                                            provider.setMoodLabel(
                                                MoodState.neutral);
                                          }
                                        },
                                        child: MoodEmoji(
                                          location: AssetConst.neutralIcon,
                                          isSelected:
                                              mood.mood == MoodState.neutral &&
                                                      provider.mood ==
                                                          MoodState.none ||
                                                  provider.mood ==
                                                      MoodState.neutral,
                                        ),
                                      ),

                                      // Exited Emoji
                                      GestureDetector(
                                        onTap: () {
                                          if (mood.mood == MoodState.excited &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood ==
                                                  MoodState.excited) {
                                            provider.setMood(MoodState.none);
                                            provider
                                                .setMoodLabel(MoodState.none);
                                          } else {
                                            provider.setMood(MoodState.excited);
                                            provider.setMoodLabel(
                                                MoodState.excited);
                                          }
                                        },
                                        child: MoodEmoji(
                                          location: AssetConst.winkingIcon,
                                          isSelected:
                                              mood.mood == MoodState.excited &&
                                                      provider.mood ==
                                                          MoodState.none ||
                                                  provider.mood ==
                                                      MoodState.excited,
                                        ),
                                      ),

                                      // Cheerful Emoji
                                      GestureDetector(
                                        onTap: () {
                                          if (mood.mood == MoodState.cheerful &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood ==
                                                  MoodState.cheerful) {
                                            provider.setMood(MoodState.none);
                                            provider
                                                .setMoodLabel(MoodState.none);
                                          } else {
                                            provider
                                                .setMood(MoodState.cheerful);
                                            provider.setMoodLabel(
                                                MoodState.cheerful);
                                          }
                                        },
                                        child: MoodEmoji(
                                          location: AssetConst.blushingIcon,
                                          isSelected:
                                              mood.mood == MoodState.cheerful &&
                                                      provider.mood ==
                                                          MoodState.none ||
                                                  provider.mood ==
                                                      MoodState.cheerful,
                                        ),
                                      ),

                                      // Happy Emoji
                                      GestureDetector(
                                        onTap: () {
                                          if (mood.mood == MoodState.happy &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood ==
                                                  MoodState.happy) {
                                            provider.setMood(MoodState.none);
                                            provider
                                                .setMoodLabel(MoodState.none);
                                          } else {
                                            provider.setMood(MoodState.happy);
                                            provider
                                                .setMoodLabel(MoodState.happy);
                                          }
                                        },
                                        child: MoodEmoji(
                                          location: AssetConst.happyIcon,
                                          isSelected: mood.mood ==
                                                      MoodState.happy &&
                                                  provider.mood ==
                                                      MoodState.none ||
                                              provider.mood == MoodState.happy,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: Spacing.spacing),
                                Text(
                                  provider.moodLabel == 'Select Your Mood'
                                      ? 'You\'re ${mood.moodLabel}'
                                      : 'You\'re ${provider.moodLabel}',
                                  style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: ThemeColor.neutral_900,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                const SizedBox(height: Spacing.spacing * 2),
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
                                  controller: titleController,
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
                                  validator: (value) =>
                                      provider.validateTitle(value),
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
                                  controller: descController,
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
                                    hintText: 'How do you feel?',
                                    hintStyle: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: ThemeColor.neutral_500,
                                          ),
                                    ),
                                  ),
                                  validator: (value) =>
                                      provider.validateDesc(value),
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
                                  padding:
                                      const EdgeInsets.all(Spacing.spacing),
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
                                        onPressed: () async {
                                          final pickedFileGallery =
                                              await ImagePicker().pickImage(
                                                  source: ImageSource.gallery);
                                          if (pickedFileGallery != null) {
                                            provider
                                                .setImage(pickedFileGallery);
                                          }
                                        },
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
                                            onPressed: () async {
                                              final pickedFileCamera =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (pickedFileCamera != null) {
                                                provider
                                                    .setImage(pickedFileCamera);
                                              }
                                            },
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
                                const SizedBox(height: Spacing.spacing),
                                Consumer<RecordProvider>(
                                    builder: (context, provider, _) {
                                  if (provider.state == MyState.none &&
                                      provider.selectedImage ==
                                          ImageState.none) {
                                    return Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: ThemeColor.neutral_200),
                                        ),
                                        child: Center(
                                            child: Image.network(mood.imageUrl))
                                        // const Center(
                                        //     child: Text('No Image')
                                        //     ),
                                        );
                                  } else if (provider.state == MyState.none &&
                                      provider.selectedImage ==
                                          ImageState.notSelected) {
                                    return Container(
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: ThemeColor.error_400),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        'Please select an image.',
                                        style: TextStyle(
                                            color: ThemeColor.error_400),
                                      )),
                                    );
                                  } else if (provider.state ==
                                          MyState.success &&
                                      provider.selectedImage ==
                                          ImageState.selected) {
                                    return Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: ThemeColor.neutral_200),
                                        ),
                                        child: Center(
                                            child: Image.file(
                                                File(provider.image!.path),
                                                fit: BoxFit.cover)));
                                  } else if (provider.state ==
                                          MyState.loading &&
                                      provider.selectedImage ==
                                          ImageState.selected) {
                                    return Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: ThemeColor.neutral_200),
                                        ),
                                        child: Center(
                                            child: Image.file(
                                                File(provider.image!.path),
                                                fit: BoxFit.cover)));
                                  } else if (provider.state == MyState.none &&
                                      provider.selectedImage ==
                                          ImageState.selected) {
                                    return Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: ThemeColor.neutral_200),
                                        ),
                                        child: Center(
                                            child: Image.file(
                                                File(provider.image!.path),
                                                fit: BoxFit.cover)));
                                  } else if (provider.image == null) {
                                    return Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1.0,
                                              color: ThemeColor.neutral_200),
                                        ),
                                        child: Center(
                                            child: Image.network(mood.imageUrl))
                                        // const Center(
                                        //     child: Text('No Image')),
                                        );
                                  } else {
                                    return const SizedBox();
                                  }
                                }),
                                const SizedBox(height: Spacing.spacing),
                                Consumer<RecordProvider>(
                                    builder: (context, provider, _) {
                                  return Center(
                                    child: provider.state == MyState.loading
                                        ? const SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color: ThemeColor.primary,
                                            ),
                                          )
                                        : SizedBox(
                                            width: double.infinity,
                                            height: 45,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    ThemeColor.primary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          CustomRadius
                                                              .defaultRadius),
                                                ),
                                              ),
                                              onPressed: () async {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  provider.setTitle(
                                                      titleController.text);
                                                  provider.setDesc(
                                                      descController.text);

                                                  final moodModel =
                                                      provider.listMood[index];
                                                  await provider
                                                      .updateMood(moodModel);
                                                  provider.getMoodByDate();
                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                            "Mood has been successfully edited."),
                                                        backgroundColor:
                                                            Colors.green,
                                                      ),
                                                    );
                                                    titleController.clear();
                                                    descController.clear();
                                                    Navigator.pop(context);
                                                  } else {
                                                    if (context.mounted) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Oops! Something error!'),
                                                          backgroundColor:
                                                              ThemeColor
                                                                  .error_400,
                                                        ),
                                                      );
                                                      provider.getMoodByDate();
                                                    }
                                                  }
                                                }
                                              },
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
                                  );
                                }),
                                const SizedBox(height: Spacing.spacing),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
