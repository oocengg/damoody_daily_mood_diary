import 'dart:io';

import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/image_state.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddDescriptionMood extends StatefulWidget {
  const AddDescriptionMood({Key? key}) : super(key: key);

  @override
  State<AddDescriptionMood> createState() => _AddDescriptionMoodState();
}

class _AddDescriptionMoodState extends State<AddDescriptionMood> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecordProvider>(context, listen: false);
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
                        InkWell(
                          onTap: () {
                            provider.setMood(MoodState.none);
                            provider.setMoodLabel(MoodState.none);
                            provider.image = null;
                            provider.selectedImage = ImageState.none;
                            provider.state = MyState.none;
                            provider.getMoodByDate();
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.keyboard_arrow_down),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: Spacing.spacing * 2,
                          ),
                          child: Form(
                            key: _formKey,
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
                                      child:
                                          const Center(child: Text('No Image')),
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
                                        child: provider.image != null
                                            ? Center(
                                                child: Image.file(
                                                    File(provider.image!.path),
                                                    fit: BoxFit.cover))
                                            : const Center(
                                                child: Text('Add Image ...')));
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
                                      child:
                                          const Center(child: Text('No Image')),
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

                                                  await provider.addMood();

                                                  if (provider.state ==
                                                      MyState.success) {
                                                    if (context.mounted) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                          content: Text(
                                                              'Success Add Mood!'),
                                                          backgroundColor:
                                                              ThemeColor
                                                                  .success_400,
                                                        ),
                                                      );
                                                      titleController.clear();
                                                      descController.clear();
                                                      provider.getMoodByDate();
                                                      Navigator.pop(context);
                                                    }
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
                                                    }
                                                  }
                                                  // if (context.mounted) {
                                                  //   Navigator.pop(context);
                                                  // }
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
