import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(child: provider.pages[provider.selectedIndex]),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 9),
                ),
              ],
              color: ThemeColor.white,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spacing,
              vertical: Spacing.spacing + 5,
            ),
            child: GNav(
              backgroundColor: ThemeColor.white,
              color: ThemeColor.secondary,
              activeColor: ThemeColor.white,
              tabBackgroundColor: ThemeColor.secondary,
              padding: const EdgeInsets.all(Spacing.spacing * 2),
              gap: Spacing.spacing,
              tabs: const [
                GButton(
                  icon: CustomIcon.home,
                  text: 'Home',
                ),
                GButton(
                  icon: CustomIcon.search,
                  text: 'Record',
                ),
                GButton(
                  icon: CustomIcon.handHoldingMedical,
                  text: 'Meditation',
                ),
                GButton(
                  icon: CustomIcon.notifications,
                  text: 'Notifcation',
                ),
                GButton(
                  icon: CustomIcon.user,
                  text: 'Profile',
                ),
              ],
              onTabChange: (index) => provider.setSelectedIndex(index),
            ),
          ),
        );
      },
    );
  }
}
