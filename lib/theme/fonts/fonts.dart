import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/color.dart';

class FontApp {
  static TextStyle titleText = GoogleFonts.inter(
    color: ColorApp.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitleText1 = GoogleFonts.inter(
    color: ColorApp.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle subtitleText2 = GoogleFonts.inter(
    color: ColorApp.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subtitleText3 = GoogleFonts.inter(
    color: ColorApp.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle descriptionText = GoogleFonts.inter(
    color: ColorApp.greyColor,
    fontSize: 14,
  );
  static TextStyle buttonText = GoogleFonts.inter(
    color: ColorApp.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static TextStyle placeHolderText = GoogleFonts.inter(
    color: ColorApp.blackColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
