import 'package:flutter/cupertino.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/drawer_items/billing_pages/desktop_summary_page.dart';
import 'package:mi_hackathon/frontend/mobile/drawer_items/billing_pages/mobile_summary_page.dart';
import 'package:mi_hackathon/frontend/tablet/drawer_items/billing_pages/tablet_summary_page.dart';

class Summary_Page extends StatefulWidget {
  const Summary_Page({Key? key}) : super(key: key);

  @override
  State<Summary_Page> createState() => _Summary_PageState();
}

class _Summary_PageState extends State<Summary_Page> {
  @override
  Widget build(BuildContext context) {
    return createWidget(
      context: context,
      desktop: const Desktop_Summary_Page(),
      tablet: const Tablet_Summary_Page(),
      mobile: const Mobile_Summary_Page(),
    );
  }
}
