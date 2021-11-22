import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:resto/theme/fonts/fonts.dart';

class PageViewWidget {
  static List<PageViewModel> pageViewWidget = [
    PageViewModel(
      title: 'Restaurant Terdekat',
      decoration: PageDecoration(
        titleTextStyle: FontApp.titleText,
        bodyTextStyle: FontApp.descriptionText,
        descriptionPadding: const EdgeInsets.only(left: 64, right: 45),
      ),
      body:
          'Anda tidak perlu pergi jauh untuk menemukan restoran yang bagus,kami telah menyediakan semua restoran yang di dekat Anda',
      image: Image.asset(
        'assets/images/nearby.png',
      ),
    ),
    PageViewModel(
      title: 'Favorite Menu',
      body:
          ' Sekarang makan enak, jangan keluar rumah, Kamu bisa pilih makanan favorit Anda hanya dengan satu klik',
      image: Image.asset(
        'assets/images/favorite_menu.png',
      ),
      decoration: PageDecoration(
        titleTextStyle: FontApp.titleText,
        imagePadding: const EdgeInsets.only(top: 100),
        bodyTextStyle: FontApp.descriptionText,
        descriptionPadding: const EdgeInsets.only(left: 64, right: 45),
      ),
    ),
    PageViewModel(
      title: 'Murah Namun Terjamin ',
      body: ' Anda bisa makan di restoran mahal dengan harga terjangkau',
      image: Image.asset(
        'assets/images/cheap_price.png',
      ),
      decoration: PageDecoration(
        titleTextStyle: FontApp.titleText,
        imagePadding: const EdgeInsets.only(top: 100),
        bodyTextStyle: FontApp.descriptionText,
        descriptionPadding: const EdgeInsets.only(left: 64, right: 45),
      ),
    ),
  ];
}
