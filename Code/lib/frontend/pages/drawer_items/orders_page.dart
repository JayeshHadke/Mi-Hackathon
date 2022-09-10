import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/desktop_orders_page.dart';
import 'package:mi_hackathon/frontend/mobile/drawer_items/mobile_orders_page.dart';
import 'package:mi_hackathon/frontend/tablet/drawer_items/tablet_orders_page.dart';

class Orders_Page extends StatefulWidget {
  const Orders_Page({Key? key}) : super(key: key);

  @override
  State<Orders_Page> createState() => _Orders_PageState();
}

class _Orders_PageState extends State<Orders_Page> {
  @override
  Widget build(BuildContext context) {
    return createWidget(
      context: context,
      desktop: Desktop_Orders_Page(),
      tablet: Tablet_Orders_Page(),
      mobile: Mobile_Orders_Page(),
    );
  }
}
