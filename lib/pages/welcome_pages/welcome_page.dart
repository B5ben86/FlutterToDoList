import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uptodo/pages/intro_pages/intro_last_page.dart';
import 'package:uptodo/pages/intro_pages/intro_step_one_page.dart';
import 'package:uptodo/pages/welcome_pages/intro_page_display_handle.dart';
import 'package:uptodo/utility/svg_images/svg_images_getter.dart';
import 'package:uptodo/utility/tools/NavigateHandler.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Timer timer;

  void startTimer() {
    int counter = 3;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        counter--;
        if (counter == 0) {
          var result = await shouldShowIntroPage();
          if (result == true) {
            navigateToIntroPage();
          } else {
            navigateToIntroLastPage();
          }
        }
      },
    );
  }

  void navigateToIntroPage() {
    NavigateHandler().pushReplacement(context, const IntroStepOnePage());
  }

  void navigateToIntroLastPage() {
    NavigateHandler().pushReplacement(context, const IntroLastPage());
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: welcomePageLogoSvg,
    );
  }
}
