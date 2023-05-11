import 'package:damodi_daily_mood_diary/utils/extensions/date_extension.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/themes/custom_icon.dart';
import 'package:damodi_daily_mood_diary/utils/themes/radius.dart';
import 'package:damodi_daily_mood_diary/utils/themes/spacing.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/add_mood.dart';
import 'package:damodi_daily_mood_diary/views/record/widgets/mood_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecordProvider>(context, listen: false);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mood Record',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: ThemeColor.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    InkWell(
                      onTap: () => provider.getMoodByDate(),
                      child: const Icon(
                        Icons.refresh,
                        color: ThemeColor.primary,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Spacing.spacing * 3),
                Consumer<RecordProvider>(builder: (context, provider, _) {
                  return TableCalendar(
                    focusedDay: provider.selectedDate,
                    firstDay: DateTime.utc(DateTime.now().year, 1, 1),
                    lastDay: DateTime.utc(
                        DateTime.now().year, DateTime.now().month + 1, 0),
                    calendarFormat: CalendarFormat.week,
                    selectedDayPredicate: (day) {
                      return isSameDay(provider.selectedDate, day);
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
                    onDaySelected: (selectedDay, focusedDay) {
                      provider.updateSelectedDate(selectedDay);
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: ThemeColor.secondary,
                        borderRadius: BorderRadius.circular(
                            CustomRadius.defaultRadius * 5),
                      ),
                      todayTextStyle:
                          const TextStyle(color: ThemeColor.secondary),
                      weekendTextStyle: TextStyle(
                        color: ThemeColor.secondary.withOpacity(0.5),
                      ),
                      defaultTextStyle: TextStyle(
                          color: ThemeColor.secondary.withOpacity(0.5)),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: ThemeColor.secondary),
                      weekendStyle: TextStyle(color: ThemeColor.secondary),
                    ),
                  );
                }),
                const SizedBox(height: Spacing.spacing * 3),
                Consumer<RecordProvider>(
                  builder: (context, provider, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (provider.selectedDate.day ==
                            DateTime.now().day) ...[
                          Text(
                            'Today\'s Mood',
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
                        ] else ...[
                          Text(
                            provider.selectedDate.toHumanDateShort(),
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
                        ],
                        const SizedBox(height: Spacing.spacing),
                        if (provider.state == MyState.loading) ...[
                          const Center(
                            child: CircularProgressIndicator(
                              color: ThemeColor.primary,
                            ),
                          ),
                        ] else if (provider.state == MyState.success &&
                            provider.listMood.isNotEmpty) ...[
                          ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.listMood.length,
                            itemBuilder: (context, index) {
                              final mood = provider.listMood[index];
                              return Column(
                                children: [
                                  MoodBar(
                                    title: mood.title,
                                    desc: mood.description,
                                    moodLabel: mood.moodLabel,
                                    createdAt: mood.createdAt.toHumanDateTime(),
                                    mood: mood.mood,
                                    // id: mood.id,
                                    index: index,
                                  ),
                                  const SizedBox(
                                    height: Spacing.spacing,
                                  ),
                                ],
                              );
                            },
                          )
                        ] else if (provider.state == MyState.error) ...[
                          const Center(
                            child: Text('Oops! Something went error.'),
                          ),
                        ] else if (provider.listMood.isEmpty &&
                            provider.state == MyState.success) ...[
                          const Center(
                            child: Text('Mood record is empty.'),
                          ),
                        ],
                        const SizedBox(height: Spacing.spacing),
                      ],
                    );
                  },
                ),
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
