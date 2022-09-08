import 'package:flutter/material.dart';

// Background Colors
Color mainBackgroundColor = const Color(0xffffffff);
Color subBackgroundColor = const Color(0xffD9D9D9);

// Text Colors
Color mainTextColor = const Color(0xff000000);
Color subTextColor = const Color(0xff1F1F1F);

// Class use to Specify the Screen Width
// Do not use this class
class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

// Use this method to check and return appropriate widget
createWidget(
    BuildContext context, Widget desktop, Widget tablet, Widget mobile) {
  if (MediaQuery.of(context).size.shortestSide > FormFactor.desktop) {
    return desktop;
  }
  if (MediaQuery.of(context).size.shortestSide > FormFactor.tablet) {
    return tablet;
  }
  if (MediaQuery.of(context).size.shortestSide > FormFactor.handset) {
    return mobile;
  }
}
