import 'package:damodi_daily_mood_diary/utils/constants/assets_const.dart';
import 'package:damodi_daily_mood_diary/utils/constants/routes_const.dart';
import 'package:damodi_daily_mood_diary/utils/themes/colors.dart';
import 'package:damodi_daily_mood_diary/utils/widgets/custom_text_button.dart';
import 'package:damodi_daily_mood_diary/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: ThemeColor.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Welcome To Damoody!',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                            offset: const Offset(
                                0, 6), // changes position of shadow
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
                        // const CustomTextField(
                        //   // controller: controller.emailController,
                        //   hintText: "Email",
                        //   keyboardType: TextInputType.emailAddress,
                        // ),
                        // const SizedBox(
                        //   height: 24,
                        // ),
                        // const CustomTextField(
                        //   // controller: controller.passwordController,
                        //   hintText: "Password",
                        //   keyboardType: TextInputType.visiblePassword,
                        // ),
                        // const SizedBox(
                        //   height: 24,
                        // ),
                        // CustomTextButton(
                        //   title: "Sign in",
                        //   onPressed: () {
                        //     // controller.login();
                        //   },
                        //   textColor: Colors.white,
                        //   backgroundColor: ThemeColor.primary,
                        // ),
                        // const SizedBox(
                        //   height: 24,
                        // ),
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
                        CustomTextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.home);
                          },
                          title: "Sign in with Google",
                          svgLocation: AssetConst.googleIcon,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Copyright Damoody 2023.",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     InkWell(
                        //       onTap: () {},
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text(
                        //             "Don't have an account?",
                        //             style: GoogleFonts.poppins(
                        //               fontSize: 12,
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 8,
                        //           ),
                        //           Text(
                        //             "Sign up",
                        //             style: GoogleFonts.poppins(
                        //               fontSize: 12,
                        //               color: ThemeColor.primary,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     Text(
                        //       "Forgot password?",
                        //       style: GoogleFonts.poppins(
                        //         fontSize: 12,
                        //         color: ThemeColor.primary,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
