import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../auth/login.dart';
import '../../../constants.dart';

class OnBoarding extends StatefulWidget {
  static const routeName = '/onboarding-screen';

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // setOnBoardingShownTrue();
    // Navigator.of(context).pushReplacementNamed(MainPanel.routeName);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  Widget _buildImage(String assetName, double width) {
    return Align(
      child: Image.asset(
        'assets/images/$assetName',
        width: 250,
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  // setOnBoardingShownTrue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() async {
  //     await prefs.setBool('onBoardingShown', true);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    const bodyStyle = TextStyle(
      fontSize: 22,
      color: Colors.white,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyTextStyle: TextStyle(color: Colors.black),
      descriptionPadding: EdgeInsets.fromLTRB(16, 10, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    PageViewModel _buildPageViewModel({title = '', body, image}) {
      return PageViewModel(
        title: title,
        body: body,
        image: image,
        decoration: pageDecoration,
      );
    }

    return IntroductionScreen(
      key: introKey,
      pages: [
        _buildPageViewModel(
          body: onboardingText1,
          image: _buildImage('cankurtaran-logo.png', deviceWidth * 0.5),
        ),
        _buildPageViewModel(
          body: onboardingText2,
          image: _buildImage('cankurtaran-logo.png', deviceWidth * 0.5),
        ),
        _buildPageViewModel(
          body: onboardingText3,
          image: _buildImage('cankurtaran-logo.png', deviceWidth * 0.5),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      done: const Text(
        'Başla',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: primaryColor,
        activeColor: Colors.black,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
