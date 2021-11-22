import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:resto/apps/widgets/page_view_widget.dart';
import 'package:resto/theme/color/color.dart';
import 'package:resto/theme/fonts/fonts.dart';

import 'landing_page.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = '/';
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _introKey = GlobalKey<IntroductionScreenState>();
  void _onOnBoardEnd(context) {
    Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      globalBackgroundColor: Colors.white,
      pages: PageViewWidget.pageViewWidget,
      onDone: () => _onOnBoardEnd(context),
      onSkip: () => _onOnBoardEnd(context),
      next: Icon(
        Icons.arrow_forward_outlined,
        color: ColorApp.primaryColor,
      ),
      done: Text(
        'Selesai',
        style: FontApp.descriptionText.copyWith(
          color: ColorApp.primaryColor,
        ),
      ),
      dotsDecorator: DotsDecorator(
        activeColor: ColorApp.primaryColor,
      ),
      showDoneButton: true,
      showNextButton: true,
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: FontApp.subtitleText3.copyWith(color: ColorApp.greyColor),
      ),
    );
  }
}
