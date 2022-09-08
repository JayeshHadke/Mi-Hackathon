import 'package:flutter/material.dart';

// Background Colors
Color mainBackgroundColor = const Color(0xffe94f1d);
Color subBackgroundColor = const Color(0xffD9D9D9);

// Text Colors
Color mainTextColor = const Color(0xff000000);
Color subTextColor = const Color(0xff1F1F1F);

// Class use to Specify the Screen Width
// Do not use this class
class FormFactor {
  static double desktop = 1200;
  static double tablet = 400;
  static double handset = 400;
}

// Use this method to check and return appropriate widget

createWidget(
    BuildContext context, Widget desktop, Widget tablet, Widget mobile) {
  if (MediaQuery.of(context).size.width > FormFactor.desktop) {
    return desktop;
  }
  if (MediaQuery.of(context).size.width > FormFactor.tablet) {
    return tablet;
  }
  if (MediaQuery.of(context).size.width < FormFactor.handset) {
    return mobile;
  }
}

getHeight(BuildContext context, double size) {
  return MediaQuery.of(context).size.height * size;
}

getWidth(BuildContext context, double size) {
  return MediaQuery.of(context).size.width * size;
}

headingText(BuildContext context, String str, double size) {
  return Text(
    str,
    style: TextStyle(
        color: mainBackgroundColor,
        fontFamily: 'BalooBhai2',
        fontSize: getHeight(context, size),
        fontWeight: FontWeight.w500),
  );
}

mainText(BuildContext context, String str, double size) {
  return Text(
    str,
    style: TextStyle(
      fontFamily: 'BalooBhai2',
      color: mainTextColor,
      fontWeight: FontWeight.w300,
      fontSize: getHeight(context, size),
    ),
  );
}

subText(BuildContext context, String str, double size) {
  return Text(
    str,
    style: TextStyle(
      fontFamily: 'BalooBhai2',
      color: mainTextColor,
      fontSize: getHeight(context, size),
    ),
  );
}
