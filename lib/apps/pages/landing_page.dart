import 'package:flutter/material.dart';
import 'package:resto/theme/color/color.dart';
import 'package:resto/theme/fonts/fonts.dart';

import 'homepage.dart';

class LandingPage extends StatelessWidget {
  static const routeName = '/landing-page';

  const LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 280,
                  margin: const EdgeInsets.only(
                    top: 135,
                  ),
                  child: Image.asset(
                    'assets/images/landing_image.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 55.01,
              ),
              Text(
                'Selamat Datang!',
                style: FontApp.titleText,
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 60,
                  right: 59,
                ),
                child: Text(
                  'Selamat datang di food mantap, silahkan menikmati fitur yang ada ',
                  textAlign: TextAlign.center,
                  style: FontApp.descriptionText,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                height: 49,
                margin: const EdgeInsets.only(
                  left: 60,
                  right: 59,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorApp.primaryColor,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  child: Text('Masuk Halaman Utama', style: FontApp.buttonText),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      HomePage.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
