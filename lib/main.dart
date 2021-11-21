import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/apps/model/restaurant.dart';
import 'package:resto/apps/pages/homepage.dart';
import 'package:resto/apps/pages/search_page.dart';

import 'apps/pages/add_review.dart';
import 'apps/pages/detail_page.dart';
import 'apps/pages/landing_page.dart';
import 'apps/pages/onboarding_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: OnBoardingPage.routeName, routes: {
      OnBoardingPage.routeName: (context) => const OnBoardingPage(),
      LandingPage.routeName: (context) => const LandingPage(),
      HomePage.routeName: (context) => HomePage(),
      SearchPage.routeName: (context) => SearchPage(
            query: ModalRoute.of(context)!.settings.arguments as String,
          ),
      DetailPage.routeName: (context) => DetailPage(
            restaurant: ModalRoute.of(context)!.settings.arguments
                as RestaurantsDetails,
          ),
      AddReviewPage.routeName: (context) => AddReviewPage(
          ModalRoute.of(context)!.settings.arguments as RestaurantsDetails),
    });
  }
}
