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
        // Index with Title
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              left: getWidth(context, 0.1),
            ),
            width: double.maxFinite,
            height: getHeight(context, 0.15),
            decoration: BoxDecoration(
              color: subBackgroundColor,
            ),
            alignment: Alignment.centerLeft,
            child: Row(children: [
              Image.asset(
                'assets/images/xiaomi_logo_nolabel.png',
                height: getHeight(context, 0.1),
              ),
              SizedBox(
                width: getWidth(context, 0.01),
              ),
              headingText(context, 'Mi Store India', 0.05)
            ]),
          ),
        ),
        Positioned(
          top: getHeight(context, 0.2),
          left: 0,
          right: 0,
          height: getHeight(context, 0.5),
          child: Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/xiaomi_logo.png',
                  height: getHeight(context, 0.3),
                ),
                Container(
                  width: getWidth(context, 0.2),
                  color: Colors.black12,
                  child: Column(
                    children: [
                      mainText(
                        context,
                        'LogIn/SignUp',
                        0.04,
                      ),
                      TextField(
                        cursorColor: mainBackgroundColor,
                        decoration: InputDecoration(
                          label: subText(context, 'Email Id / Mi Id', 0.02),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainBackgroundColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: subBackgroundColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: getHeight(context, 0.03),
          child: Container(
            color: subBackgroundColor,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subText(context, '      @All CopyRights Reserved', 0.015),
                subText(context, 'Xiaomi India      ', 0.015),
              ],
            ),
          ),
        )
      ],
    );
  }
}
