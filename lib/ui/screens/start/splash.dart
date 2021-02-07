import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

import 'package:cankurtaran/ui/screens/start/onboarding.dart';

class Splash extends StatelessWidget {
  static const routeName = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      imagePath: 'assets/images/earthquake-icon.jpg',
      backGroundColor: Colors.white,
      animationEffect: 'fade-in',
      logoSize: 200,
      home: OnBoarding(),
      duration: 2000,
      type: CustomSplashType.StaticDuration,
    );
  }
}