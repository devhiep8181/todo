import 'package:flutter/material.dart';
import 'package:todo/core/constants/color_palette.dart';

class CustomStyle {
  static const String fontRoboto = "Roboto";
  static const String fontMontserrat = "Montserrat";
  static const String fontSassoon = "Sassoon";

  static TextStyle sloganText(BuildContext context) {
    return const TextStyle(
        fontFamily: fontSassoon, fontSize: 32, color: Colors.white);
  }

  static TextStyle giftText(BuildContext context) {
    return const TextStyle(
      fontFamily: fontMontserrat,
      fontSize: 15,
      color: Color(0xffC1CC41),
    );
  }

  static TextStyle headingText(BuildContext context) {
    return const TextStyle(
        fontFamily: fontMontserrat,
        fontSize: 20,
        color: ColorPalette.primaryColor);
  }

  static TextStyle itemText(BuildContext context) {
    return TextStyle(
        fontFamily: fontMontserrat,
        fontSize: 14,
        color: ColorPalette.textItemColor.withOpacity(0.8));
  }

  static TextStyle subText(BuildContext context) {
    return TextStyle(
        fontFamily: fontMontserrat,
        fontSize: 12,
        color: ColorPalette.textItemColor.withOpacity(0.8));
  }

  static TextStyle titleText(BuildContext context) {
    return const TextStyle(
        fontFamily: fontMontserrat,
        fontSize: 16,
        color: ColorPalette.textTitleColor);
  }

  static TextStyle hiddenText(BuildContext context) {
    return TextStyle(
        fontFamily: fontMontserrat,
        fontSize: 14,
        color: ColorPalette.textHiddenrColor.withOpacity(0.5));
  }

  static TextStyle buttonText(BuildContext context) {
    return const TextStyle(
        fontFamily: fontMontserrat, fontSize: 14, color: Colors.white);
  }
}
