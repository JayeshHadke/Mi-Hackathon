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
  static double desktop = 1000;
  static double tablet = 600;
  static double handset = 600;
}

// Use this method to check and return appropriate widget

createWidget(
    {required BuildContext context,
    required Widget desktop,
    required Widget tablet,
    required Widget mobile}) {
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

mainText(
    {required BuildContext context,
    required String str,
    double size = 0.04,
    Color color = Colors.black}) {
  return Text(
    str,
    style: TextStyle(
      fontFamily: 'BalooBhai2',
      color: color,
      fontWeight: FontWeight.w300,
      fontSize: getHeight(context, size),
    ),
  );
}

subText(
    {required BuildContext context, required String str, double size = 0.02}) {
  return Text(
    str,
    style: TextStyle(
      fontFamily: 'BalooBhai2',
      color: mainTextColor,
      fontSize: getHeight(context, size),
    ),
  );
}

var itemsType = <String, Map<String, _item>>{
  'Smart Phones': smartPhonesItems,
  'TV': accessoriesItems,
  'Laptop': accessoriesItems,
  'Smart Home': accessoriesItems,
  'Accessories': accessoriesItems,
};

int selectedItemTypeIndex = 0;

class _item {
  String url;
  String name;
  double price;
  _item({required this.url, required this.name, required this.price});
}

var smartPhonesItems = <String, _item>{
  'Mi 11 Lite': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/Mi%2011%20Lite.png',
      name: 'Mi 11 Lite',
      price: 000),
  'Compact Speakers': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Compact%20Speakers.png',
      name: 'Compact Speakers',
      price: 000),
  'Dual Port Charger': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Dual%20Port%20Charger.png',
      name: 'Dual Port Charger',
      price: 000),
  'EarPods': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/EarPods.png',
      name: 'EarPods',
      price: 000),
  'Earphones': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Earphones.png',
      name: 'EarPhones',
      price: 000),
  'HeadPhones': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Headphones.png',
      name: 'HeadPhones',
      price: 000),
};

var accessoriesItems = <String, _item>{
  'Car Charger': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Car%20Charrger.png',
      name: 'Car Charger',
      price: 000),
  'Compact Speakers': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Compact%20Speakers.png',
      name: 'Compact Speakers',
      price: 000),
  'Dual Port Charger': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Dual%20Port%20Charger.png',
      name: 'Dual Port Charger',
      price: 000),
  'EarPods': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/EarPods.png',
      name: 'EarPods',
      price: 000),
  'Earphones': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Earphones.png',
      name: 'EarPhones',
      price: 000),
  'HeadPhones': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Headphones.png',
      name: 'HeadPhones',
      price: 000),
};

var selectedItems = <_item, int>{};
