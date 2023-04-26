import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/add_mood.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/mood_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Spacing.spacing * 5,
              horizontal: Spacing.spacing * 3,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mood Record',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: ThemeColor.primary,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(
                      DateTime.now().year, DateTime.now().month, 1),
                  lastDay: DateTime.utc(
                      DateTime.now().year, DateTime.now().month + 1, 0),
                  calendarFormat: CalendarFormat.week,
                  selectedDayPredicate: (day) {
                    return isSameDay(DateTime.now(), day);
                  },
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ThemeColor.secondary,
                        borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius * 5),
                      ),
                      child: Text(
                        date.day.toString(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ThemeColor.white,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    todayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ThemeColor.background.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius * 5),
                      ),
                      child: Text(
                        date.day.toString(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: ThemeColor.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: ThemeColor.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios,
                      color: ThemeColor.secondary,
                      size: 15,
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: ThemeColor.secondary,
                      size: 15,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: ThemeColor.secondary,
                      borderRadius:
                          BorderRadius.circular(CustomRadius.defaultRadius * 5),
                    ),
                    todayTextStyle:
                        const TextStyle(color: ThemeColor.secondary),
                    weekendTextStyle: TextStyle(
                      color: ThemeColor.secondary.withOpacity(0.5),
                    ),
                    defaultTextStyle:
                        TextStyle(color: ThemeColor.secondary.withOpacity(0.5)),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: ThemeColor.secondary),
                    weekendStyle: TextStyle(color: ThemeColor.secondary),
                  ),
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Text(
                  'Today\'s Mood',
                  style: GoogleFonts.poppins(
                    textStyle:
                        Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeColor.black,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                ),
                const SizedBox(height: Spacing.spacing),
                const MoodBar(
                  title: 'Title 1',
                  desc:
                      'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  tag: 'Relaxed',
                  time: '14:05',
                  emoji: AssetConst.happyIcon,
                ),
                const SizedBox(height: Spacing.spacing),
                const MoodBar(
                  title: 'Title 2',
                  desc:
                      'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  tag: 'Relaxed',
                  time: '14:05',
                  emoji: AssetConst.happyIcon,
                ),
                const SizedBox(height: Spacing.spacing),
                const MoodBar(
                  title: 'Title 3',
                  desc:
                      'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  tag: 'Relaxed',
                  time: '14:05',
                  emoji: AssetConst.happyIcon,
                ),
                const SizedBox(height: Spacing.spacing),
                const MoodBar(
                  title: 'Title 4',
                  desc:
                      'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  tag: 'Relaxed',
                  time: '14:05',
                  emoji: AssetConst.happyIcon,
                ),
                const SizedBox(height: Spacing.spacing),
                const MoodBar(
                  title: 'Title 5',
                  desc:
                      'DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription',
                  tag: 'Relaxed',
                  time: '14:05',
                  emoji: AssetConst.happyIcon,
                ),
                const SizedBox(height: Spacing.spacing),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(CustomRadius.defaultRadius * 2),
                  topRight: Radius.circular(CustomRadius.defaultRadius * 2),
                ),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: ThemeColor.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(CustomRadius.defaultRadius * 2),
                      topRight: Radius.circular(CustomRadius.defaultRadius * 2),
                    ),
                  ),
                  child: const AddMood(),
                );
              },
            );
          },
          backgroundColor: ThemeColor.secondary,
          child: const Icon(CustomIcon.add),
        ),
      ),
    );
  }
}
