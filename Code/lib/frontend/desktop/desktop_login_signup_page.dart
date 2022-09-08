import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Desktop_LogIn_SignUp_Page extends StatefulWidget {
  const Desktop_LogIn_SignUp_Page({Key? key}) : super(key: key);

  @override
  State<Desktop_LogIn_SignUp_Page> createState() =>
      _Desktop_LogIn_SignUp_PageState();
}

class _Desktop_LogIn_SignUp_PageState extends State<Desktop_LogIn_SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: getHeight(context, 0.2),
            color: subBackgroundColor,
          ),
        ),
      ],
    );
  }
}
