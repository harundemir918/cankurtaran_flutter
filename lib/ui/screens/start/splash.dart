import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

import 'package:cankurtaran/ui/screens/start/onboarding.dart';
import '../../../constants.dart';

class Splash extends StatelessWidget {
  static const routeName = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return CustomSplash(
      imagePath: logoUrl,
      backGroundColor: Colors.white,
      animationEffect: 'fade-in',
      logoSize: deviceWidth * 0.5,
      home: OnBoarding(),
      duration: 2000,
      type: CustomSplashType.StaticDuration,
    );
  }
}