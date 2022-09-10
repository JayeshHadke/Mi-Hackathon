import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/desktop_account_page.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/desktop_content_page.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/desktop_orders_page.dart';
import 'package:mi_hackathon/frontend/mobile/drawer_items/mobile_content_page.dart';
import 'package:mi_hackathon/frontend/tablet/drawer_items/tablet_content_page.dart';

class Content_Page extends StatefulWidget {
  const Content_Page({Key? key}) : super(key: key);

  @override
  State<Content_Page> createState() => _Content_PageState();
}

class _Content_PageState extends State<Content_Page> {
  @override
  Widget build(BuildContext context) {
    return createWidget(
      context: context,
      desktop: Desktop_Content_Page(),
      tablet: Tablet_Content_Page(),
      mobile: Mobile_Content_Page(),
    );
  }
}
