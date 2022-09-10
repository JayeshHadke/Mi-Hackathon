import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/billing_pages/deskop_billing_page.dart';
import 'package:mi_hackathon/frontend/mobile/drawer_items/billing_pages/mobile_billing_page.dart';
import 'package:mi_hackathon/frontend/tablet/drawer_items/billing_pages/tablet_billing_page.dart';

class Billing_Page extends StatefulWidget {
  const Billing_Page({Key? key}) : super(key: key);

  @override
  State<Billing_Page> createState() => _Billing_PageState();
}

class _Billing_PageState extends State<Billing_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createWidget(
          context: context,
          desktop: const Desktop_Billing_Page(),
          tablet: const Tablet_Billing_Page(),
          mobile: const Mobile_Billing_Page()),
    );
  }
}
