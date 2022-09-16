import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Tablet_Account_Page extends StatefulWidget {
  const Tablet_Account_Page({Key? key}) : super(key: key);

  @override
  State<Tablet_Account_Page> createState() => _Tablet_Account_PageState();
}

class _Tablet_Account_PageState extends State<Tablet_Account_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(
                context,
                0.01,
              ),
            ),
            Container(
              child: subText(
                  context: context,
                  size: 0.04,
                  str:
                      'Thank you for using your remarkable talents and skills to fuel our mutual efforts'),
            ),
            SizedBox(
              height: getHeight(context, 0.2),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: getWidth(context, 0.3)),
              color: subBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/xiaomi_logo_nolabel.png',
                    width: getWidth(context, 0.1),
                  ),
                  SizedBox(
                    width: getWidth(context, 0.02),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mainText(
                          context: context, str: currentUser!.name, size: 0.08),
                      mainText(
                        context: context,
                        str: '${currentUser!.storeName} ',
                      ),
                      mainText(
                        context: context,
                        str: '${currentUser!.posId} ',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
