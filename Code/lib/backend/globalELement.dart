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
    Color backgroundColor = Colors.transparent,
    Color color = Colors.black,
    TextAlign align = TextAlign.center}) {
  return Text(
    str,
    textAlign: align,
    style: TextStyle(
        fontFamily: 'BalooBhai2',
        color: color,
        fontWeight: FontWeight.w300,
        fontSize: getHeight(context, size),
        overflow: TextOverflow.fade,
        backgroundColor: backgroundColor),
    softWrap: true,
  );
}

subText(
    {required BuildContext context,
    required String str,
    double size = 0.02,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign align = TextAlign.center}) {
  return Text(
    str,
    textAlign: align,
    style: TextStyle(
      overflow: TextOverflow.fade,
      fontFamily: 'BalooBhai2',
      color: mainTextColor,
      fontSize: getHeight(context, size),
    ),
    softWrap: true,
  );
}

var itemsType = <String, Map<String, _item>>{
  'Smart Home': smartHomeItems,
  'Smart Phones': smartPhonesItems,
  'TV': tvItems,
  'Laptop': laptopItems,
  'Accessories': accessoriesItems,
};

int selectedItemTypeIndex = 0;
int selectedItemsCount = 0;
var selectedItems = <_item, int>{};

class _item {
  String url;
  String name;
  double price;
  _item({required this.url, required this.name, required this.price});
}

var laptopItems = <String, _item>{
  'Mi NoteBook Pro': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Laptop/Mi%20NoteBook%20Pro.png',
      name: 'Mi NoteBook Pro',
      price: 99),
  'Mi NoteBook Ultra': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Laptop/Mi%20NoteBook%20Ultra.png',
      name: 'Mi NoteBook Ultra',
      price: 99),
  'Xiaomi Notebook Pro 120G': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Laptop/Xiaomi%20Notebook%20Pro%20120G.png',
      name: 'Xiaomi Notebook Pro 120G',
      price: 99)
};
var smartPhonesItems = <String, _item>{
  'Mi-A3': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/Mi-A3.png',
      name: 'Mi-A3',
      price: 99),
  'Redmi Note 10 T': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/Redmi%20Note%2010%20T.jpg',
      name: 'Redmi Note 10 T',
      price: 99),
  'Redmi Note10': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/Redmi%20Note10.jpg',
      name: 'Redmi Note10',
      price: 99),
  'Mi A1': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/mi%20A1.png',
      name: 'Mi A1',
      price: 99),
  'Redmi 11SE': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/redmi%2011SE.jpg',
      name: 'Redmi 11SE',
      price: 99),
  'Redmi 8A': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/redmi%208A.jpg',
      name: 'Redmi 8A',
      price: 99),
  'Redmi Y1': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/redmi%20Y1.jpg',
      name: 'Redmi Y1',
      price: 99),
  'Redmi-k20': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/redmi-k20.jpg',
      name: 'Redmi-k20',
      price: 99),
  'Xiaomi 12 por': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/xiaomi%2012%20por.jpg',
      name: 'Xiaomi 12 por',
      price: 99),
  'Xiaomi Redmi S2': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/xiaomi%20redmi%20S2.jpg',
      name: 'Xiaomi Redmi S2',
      price: 99),
  'Xiaomi Mi 9': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Mobiles/xiaomi-mi-9.jpg',
      name: 'Xiaomi Mi 9',
      price: 99),
};
var smartHomeItems = <String, _item>{
  'Mi LED Wi-Fi Smart Bulb (E27)': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20LED%20Wi-Fi%20Smart%20Bulb%20(E27).png',
      name: 'Mi LED Wi-Fi Smart Bulb (E27)',
      price: 99),
  'Mi Motion Activated Night Light 2': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Motion%20Activated%20Night%20Light%202.png',
      name: 'Mi Motion Activated Night Light 2',
      price: 99),
  'Mi Rechargeable LED Lamp White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Rechargeable%20LED%20Lamp%20White.png',
      name: 'Mi Rechargeable LED Lamp White',
      price: 99),
  'Mi Smart Bedside Lamp 2 White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Smart%20Bedside%20Lamp%202%20White.png',
      name: 'Mi Smart Bedside Lamp 2 White',
      price: 99),
  'Mi Smart LED Bulb (B22)': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Smart%20LED%20Bulb%20(B22).png',
      name: 'Mi Smart LED Bulb (B22)',
      price: 99),
  'Mi Smart LED Bulb (White)': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Smart%20LED%20Bulb%20(White).png',
      name: 'Mi Smart LED Bulb (White)',
      price: 99),
  'Mi Smart LED Desk Lamp 1S White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Smart%20LED%20Desk%20Lamp%201S%20White.png',
      name: 'Mi Smart LED Desk Lamp 1S White',
      price: 99),
  'Mi Water Purifier Filter PAC White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Water%20Purifier%20Filter%20PAC%20White.png',
      name: 'Mi Water Purifier Filter PAC White',
      price: 99),
  'Mi Water Purifier Filter RO White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Mi%20Water%20Purifier%20Filter%20RO%20White.png',
      name: 'Mi Water Purifier Filter RO White',
      price: 99),
  'Xiaomi Precision Screwdriver Kit Dark Grey': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Xiaomi%20Precision%20Screwdriver%20Kit%20Dark%20Grey.png',
      name: 'Xiaomi Precision Screwdriver Kit Dark Grey',
      price: 99),
  'Xiaomi Smart Air Fryer (3.5L) White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Xiaomi%20Smart%20Air%20Fryer%20(3.5L)%20White.png',
      name: 'Xiaomi Smart Air Fryer (3.5L) White',
      price: 99),
  'Xiaomi Smart Speaker (IR Control) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Xiaomi%20Smart%20Speaker%20(IR%20Control)%20Black.png',
      name: 'Xiaomi Smart Speaker (IR Control) Black',
      price: 99),
  'Xiaomi Smart Standing Fan 2 White': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Smart%20Home/Xiaomi%20Smart%20Standing%20Fan%202%20White.png',
      name: 'Xiaomi Smart Standing Fan 2 White',
      price: 99),
};
var tvItems = <String, _item>{
  'MI LED TV 4C 43 (108cm) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/MI%20LED%20TV%204C%2043%20(108cm)%20Black.png',
      name: 'MI LED TV 4C 43 (108cm) Black',
      price: 99),
  'Mi LED TV 4A Pro 80cm (32) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Mi%20LED%20TV%204A%20Pro%2080cm%20(32)%20Black.png',
      name: 'Mi LED TV 4A Pro 80cm (32) Black',
      price: 99),
  'Mi QLED TV 75 Grey': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Mi%20QLED%20TV%2075%20Grey.png',
      name: 'Mi QLED TV 75 Grey',
      price: 99),
  'Mi TV 4A 108cm (43) Horizon Edition Grey': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Mi%20TV%204A%20108cm%20(43)%20Horizon%20Edition%20Grey.png',
      name: 'Mi TV 4A 108cm (43) Horizon Edition Grey',
      price: 99),
  'Mi TV 4A 80cm (32) Horizon Edition Grey': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Mi%20TV%204A%2080cm%20(32)%20Horizon%20Edition%20Grey.png',
      name: 'Mi TV 4A 80cm (32) Horizon Edition Grey',
      price: 99),
  'Mi TV 5X 43 Metallic Grey': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Mi%20TV%205X%2043%20Metallic%20Grey.png',
      name: 'Mi TV 5X 43 Metallic Grey',
      price: 99),
  'Mi TV 5X 50 Metallic Grey': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Mi%20TV%205X%2050%20Metallic%20Grey.png',
      name: 'Mi TV 5X 50 Metallic Grey',
      price: 99),
  'Redmi Smart TV 32 HD Ready Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Redmi%20Smart%20TV%2032%20HD%20Ready%20Black.png',
      name: 'Redmi Smart TV 32 HD Ready Black',
      price: 99),
  'Redmi Smart TV X43 108 cm (43 inches) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Redmi%20Smart%20TV%20X43%20108%20cm%20(43%20inches)%20Black.png',
      name: 'Redmi Smart TV X43 108 cm (43 inches) Black',
      price: 99),
  'Redmi Smart TV X50 125.7 cm (50 inches) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Redmi%20Smart%20TV%20X50%20125.7%20cm%20(50%20inches)%20Black.png',
      name: 'Redmi Smart TV X50 125.7 cm (50 inches) Black',
      price: 99),
  'Redmi Smart TV X55 138.8cm (55 inches) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Redmi%20Smart%20TV%20X55%20138.8cm%20(55%20inches)%20Black.png',
      name: 'Redmi Smart TV X55 138.8cm (55 inches) Black',
      price: 99),
  'Xiaomi OLED Vision TV 55 Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Xiaomi%20OLED%20Vision%20TV%2055%20Black.png',
      name: 'Xiaomi OLED Vision TV 55 Black',
      price: 99),
  'Xiaomi Smart TV 5A 100 cm (40 inch) Full HD LED Android TV (2022 Model) Black':
      _item(
          url:
              'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Xiaomi%20Smart%20TV%205A%20100%20cm%20(40%20inch)%20Full%20HD%20LED%20Android%20TV%20(2022%20Model)%20Black.png',
          name: 'Xiaomi Smart TV 5A (40 inch) Full HD LED Android TV Black',
          price: 99),
  'Xiaomi Smart TV 5A 80 cm (32 inch) HD Ready LED Android TV (2022 Model) Black':
      _item(
          url:
              'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Xiaomi%20Smart%20TV%205A%2080%20cm%20(32%20inch)%20HD%20Ready%20LED%20Android%20TV%20(2022%20Model)%20Black.png',
          name: 'Xiaomi Smart TV 5A (32 inch) HD Ready LED Android TV Black',
          price: 99),
  'Xiaomi Smart TV 5A Pro 32 (80 Cm) Black': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Tv/Xiaomi%20Smart%20TV%205A%20Pro%2032%20(80%20Cm)%20Black.png',
      name: 'Xiaomi Smart TV 5A Pro 32 (80 Cm) Black',
      price: 99),
};
var accessoriesItems = <String, _item>{
  'Wireless Charger': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Wireless%20Charger.png',
      name: 'Wireless Charger',
      price: 99),
  'Web Cam': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Web%20Cam.png',
      name: 'Web Cam',
      price: 99),
  'Type C - Cable': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Type%20C%20-%20Cable.png',
      name: 'Type C - Cable',
      price: 99),
  'Type A - Cable': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Type%20A%20-%20Cable.png',
      name: 'Type A - Cable',
      price: 99),
  'Trimmer': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Trimmer.png',
      name: 'Trimmer',
      price: 99),
  'Speakers': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Speakers.png',
      name: 'Speakers',
      price: 99),
  'Selfi Stick': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Selfi%20Stick.png',
      name: 'Selfi Stick',
      price: 99),
  'Pocket Speakers': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Pocket%20Speakers.png',
      name: 'Pocket Speakers',
      price: 99),
  'Mi Mouse': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Mi%20Mouse.png',
      name: 'Mi Mouse',
      price: 99),
  'Mi BackPack': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Mi%20BackPack.png',
      name: 'Mi BackPack',
      price: 99),
  'Mi 20000mAh Power Bank': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Mi%2020000mAh%20Power%20Bank.png',
      name: 'Mi 20000mAh Power Bank',
      price: 99),
  'Mi 20000mAh Power 3i Bank': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Mi%2020000mAh%20Power%203i%20Bank.png',
      name: 'Mi 20000mAh Power 3i Bank',
      price: 99),
  'Headphones': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Headphones.png',
      name: 'Headphones',
      price: 99),
  'Earphones': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Earphones.png',
      name: 'Earphones',
      price: 99),
  'EarPods': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/EarPods.png',
      name: 'EarPods',
      price: 99),
  'Dual Port Charger': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Dual%20Port%20Charger.png',
      name: 'Dual Port Charger',
      price: 99),
  'Compact Speakers': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Compact%20Speakers.png',
      name: 'Compact Speakers',
      price: 99),
  'Car Charger': _item(
      url:
          'https://raw.githubusercontent.com/JayeshHadke/Mi-Hackathon/master/Assets/Accessories/Car%20Charrger.png',
      name: 'Car Charger',
      price: 99)
};

enum paymentTypes {
  Cash,
  UPI,
  Card,
}

var paymentTypesList = [
  'Cash',
  'UPI',
  'Card',
];

class customer {
  String? firstName;
  String? lastName;
  String? emailId;
  String? phoneNo;
  String? address;
  String? pinCode;
  String? miId;
  customer({
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.phoneNo,
    this.miId = '',
    this.pinCode = '',
    this.address = '',
  });
  clear() {
    firstName = '';
    lastName = '';
    emailId = '';
    phoneNo = '';
    address = '';
    pinCode = '';
    miId = '';
  }
}

class cart {
  customer? customerDetails;
  paymentTypes? payment;
  String? time;
  String? date;
  serialNoList serialNo;
  Map<_item, int> items;
  double price;
  bool? done;
  cart(
      {required this.customerDetails,
      required this.payment,
      required this.time,
      required this.date,
      required this.serialNo,
      required this.items,
      required this.price});
}

customer currentCustomer = customer(
    firstName: '',
    lastName: '',
    emailId: '',
    phoneNo: '',
    address: '',
    miId: '',
    pinCode: '');

class serialNoList {
  List<List<String>> serialNo = List.generate(
    selectedItems.length,
    (i) {
      return List.generate(
        selectedItems.values.toList()[i],
        (index) {
          return '';
        },
      );
    },
  );
  clean() {
    for (List<String> list in serialNo) {
      for (int i = 0; i < list.length; i++) {
        list[i] = '';
      }
    }
  }
}

var previousOrders = <cart>[];
serialNoList? serialNos;
