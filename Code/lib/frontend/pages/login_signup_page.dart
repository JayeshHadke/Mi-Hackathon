import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/desktop_login_signup_page.dart';
import 'package:mi_hackathon/frontend/mobile/mobile_login_signup_page.dart';
import 'package:mi_hackathon/frontend/tablet/tablet_login_signup_page.dart';

class LogIn_SignUp_Page extends StatefulWidget {
  const LogIn_SignUp_Page({Key? key}) : super(key: key);

  @override
  State<LogIn_SignUp_Page> createState() => _LogIn_SignUp_PageState();
}

class _LogIn_SignUp_PageState extends State<LogIn_SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createWidget(
          context: context,
          desktop: const Desktop_LogIn_SignUp_Page(),
          tablet: const Tablet_LogIn_SignUp_Page(),
          mobile: const Mobile_LogIn_SignUp_Page()),
    );
  }
}
