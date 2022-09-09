import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Mobile_LogIn_SignUp_Page extends StatefulWidget {
  const Mobile_LogIn_SignUp_Page({Key? key}) : super(key: key);

  @override
  State<Mobile_LogIn_SignUp_Page> createState() =>
      _Mobile_LogIn_SignUp_PageState();
}

class _Mobile_LogIn_SignUp_PageState extends State<Mobile_LogIn_SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 10,
        right: 10,
        left: 10,
        height: getHeight(context, 0.2),
        child: Container(
          color: subBackgroundColor,
        ),
      ),
      Column(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.asset(
              'assets/images/xiaomi_logo.png',
              height: getHeight(context, 0.1),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Positioned(
              top: 0,
              right: 20,
              left: 20,
              child: Container(
                color: Colors.red,
                height: 10,
              ))
        ],
      ),
    ]);
  }
}
