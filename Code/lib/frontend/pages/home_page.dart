import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/desktop_home_page.dart';
import 'package:mi_hackathon/frontend/mobile/mobile_home_page.dart';
import 'package:mi_hackathon/frontend/tablet/tablet_home_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createWidget(
          context, Desktop_Home_Page(), Tablet_Home_Page(), Mobile_Home_Page()),
    );
  }
}
