import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/constants/routes_const.dart';
import 'package:damodi_daily_mood_diary/utils/state/finite_state.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/widgets/custom_text_button.dart';
import 'package:damodi_daily_mood_diary/views/auth/provider/login_provider.dart';
import 'package:damodi_daily_mood_diary/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false && context.mounted) {
      await Provider.of<LoginProvider>(context, listen: false)
          .loginWithGoogle();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Hello! Welcome back to Damoody!'),
            backgroundColor: ThemeColor.success_400,
          ),
        );
        Provider.of<HomeProvider>(context, listen: false)
            .setSelectedIndex(context, 0);
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ThemeColor.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Welcome To Damoody!',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'A daily mood diary for easily note how you feel every day and track your mood patterns over time.',
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.1,
                          blurRadius: 20,
                          offset:
                              const Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(AssetConst.loginImage),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Text(
                        'Start your journey with Damoody?',
                        style: GoogleFonts.poppins(
                          color: ThemeColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Consumer<LoginProvider>(builder: (context, provider, _) {
                        return Container(
                          child: provider.state == MyState.loading
                              ? const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    color: ThemeColor.primary,
                                  ),
                                )
                              : CustomTextButton(
                                  onPressed: () async {
                                    await provider.loginWithGoogle();
                                    if (provider.state == MyState.success) {
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Success! Welcome to Damoody!'),
                                            backgroundColor:
                                                ThemeColor.success_400,
                                          ),
                                        );
                                        Provider.of<HomeProvider>(context,
                                                listen: false)
                                            .setSelectedIndex(context, 0);
                                        loginData.setBool('login', false);
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            Routes.home,
                                            (route) => false);
                                      }
                                    }
                                  },
                                  title: "Sign in with Google",
                                  svgLocation: AssetConst.googleIcon,
                                ),
                        );
                      }),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Copyright Damoody 2023.",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
