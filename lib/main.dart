import 'package:damodi_daily_mood_diary/services/notification_service.dart';
import 'package:damodi_daily_mood_diary/utils/constants/routes_const.dart';
import 'package:damodi_daily_mood_diary/views/auth/provider/login_provider.dart';
import 'package:damodi_daily_mood_diary/views/auth/screens/login_screen.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/provider/dashboard_provider.dart';
import 'package:damodi_daily_mood_diary/views/dashboard/screen/dashboard_screen.dart';
import 'package:damodi_daily_mood_diary/views/home/provider/home_provider.dart';
import 'package:damodi_daily_mood_diary/views/home/screen/home_screen.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/forest_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/meditation_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/rain_provider.dart';
import 'package:damodi_daily_mood_diary/views/meditation/provider/wave_provider.dart';
import 'package:damodi_daily_mood_diary/views/notification/provider/notification_provider.dart';
import 'package:damodi_daily_mood_diary/views/profile/provider/profile_provider.dart';
import 'package:damodi_daily_mood_diary/views/profile/screen/about_screen.dart';
import 'package:damodi_daily_mood_diary/views/profile/screen/faq_screen.dart';
import 'package:damodi_daily_mood_diary/views/record/provider/record_provider.dart';
import 'package:damodi_daily_mood_diary/views/record/screen/record_screen.dart';
import 'package:damodi_daily_mood_diary/views/splash/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initializeNotifications();
  NotificationService notificationService = NotificationService();
  await notificationService.scheduleTodayNotification();
  await notificationService.scheduleNextdayNotification();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeditationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForestProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RainProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WaveProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Damoody - Daily Mood Journal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        routes: {
          Routes.splash: (BuildContext context) => const SplashScreen(),
          Routes.home: (BuildContext context) => const HomeScreen(),
          Routes.dashboardPage: (BuildContext context) =>
              const DashboardScreen(),
          Routes.recordPage: (BuildContext context) => const RecordScreen(),
          Routes.loginPage: (BuildContext context) => const LoginScreen(),
          Routes.aboutPage: (BuildContext context) => const AboutScreen(),
          Routes.faqPage: (BuildContext context) => const FaqScreen(),
        },
      ),
    );
  }
}

// Make a branch for developing with fire base
// Dengan tujuan agar versi development setelah ui berhasil belum terganggu jikalau ada beberapa development pada firebase yang kurang tepat