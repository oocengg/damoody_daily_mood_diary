import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/constants/routes_const.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/home/provider/home_provider.dart';
import 'package:damodi_daily_mood_diary/views/profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context, listen: false);
    Widget menuItem(String text) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ThemeColor.neutral_600,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: ThemeColor.neutral_600,
          )
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 4 + 20,
                      decoration: const BoxDecoration(
                        color: ThemeColor.primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            CustomRadius.defaultRadius * 3,
                          ),
                          bottomRight: Radius.circular(
                            CustomRadius.defaultRadius * 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Spacing.spacing * 5,
                      left: Spacing.spacing * 3,
                      right: Spacing.spacing * 3,
                      bottom: Spacing.spacing * 3,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile',
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: ThemeColor.background,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                final homeProvider = Provider.of<HomeProvider>(
                                    context,
                                    listen: false);

                                await provider.logoutFromGoogle();

                                if (provider.state == MyState.success) {
                                  if (context.mounted) {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        Routes.loginPage, (route) => false);
                                    homeProvider.setSelectedIndex(context, 0);
                                  }
                                }
                              },
                              child: Consumer<ProfileProvider>(
                                  builder: (context, provider, _) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ThemeColor.error_400,
                                      borderRadius: BorderRadius.circular(
                                          CustomRadius.defaultRadius)),
                                  child: provider.state == MyState.loading
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            Text(
                                              'Logout',
                                              style: GoogleFonts.poppins(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: ThemeColor.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: Spacing.spacing,
                                            ),
                                            const Icon(
                                              CustomIcon.logout,
                                              color: ThemeColor.white,
                                            ),
                                          ],
                                        ),
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: Spacing.spacing * 5),
                        Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                    NetworkImage(provider.user?.photoURL ?? ''),
                              ),
                              const SizedBox(height: Spacing.spacing),
                              Text(
                                provider.user?.displayName ?? '',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        color: ThemeColor.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: Spacing.spacing * 3,
                  right: Spacing.spacing * 3,
                  bottom: Spacing.spacing * 3,
                ),
                child: Column(
                  children: [
                    Container(
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
                      height: 150,
                      width: double.infinity,
                      padding: const EdgeInsets.all(Spacing.spacing * 2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Mood Card right now :',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ThemeColor.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '10',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: ThemeColor.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'Cards',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: ThemeColor.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            'Damoody - Daily Mood Diary',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: ThemeColor.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacing.spacing * 3),
                    GestureDetector(
                      onTap: () {},
                      child: menuItem('Help'),
                    ),
                    const SizedBox(height: Spacing.spacing * 3),
                    GestureDetector(
                      onTap: () {},
                      child: menuItem('Privacy & Policy'),
                    ),
                    const SizedBox(height: Spacing.spacing * 3),
                    GestureDetector(
                      onTap: () {},
                      child: menuItem('Term of Service'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
