import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/desktop_account_page.dart';
import 'package:mi_hackathon/frontend/mobile/drawer_items/mobile_account_page.dart';
import 'package:mi_hackathon/frontend/tablet/drawer_items/tablet_account_page.dart';

class Account_Page extends StatefulWidget {
  const Account_Page({Key? key}) : super(key: key);

  @override
  State<Account_Page> createState() => _Account_PageState();
}

class _Account_PageState extends State<Account_Page> {
  @override
  Widget build(BuildContext context) {
    return createWidget(
      context: context,
      desktop: Desktop_Account_Page(),
      tablet: Tablet_Account_Page(),
      mobile: Mobile_Account_Page(),
    );
    ;
  }
}
