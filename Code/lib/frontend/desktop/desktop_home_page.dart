import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Desktop_Home_Page extends StatefulWidget {
  const Desktop_Home_Page({Key? key}) : super(key: key);

  @override
  State<Desktop_Home_Page> createState() => _Desktop_Home_PageState();
}

class _Desktop_Home_PageState extends State<Desktop_Home_Page> {
  String name = currentUser!.name;
  String email = currentUser!.email;
  String storeName = currentUser!.storeName;
  String posId = currentUser!.posId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getHeight(context, 0.1),
        backgroundColor: subBackgroundColor,
        elevation: 5,
        title: Container(
            child: Row(
          children: [
            Image.asset(
              'assets/images/xiaomi_logo_nolabel.png',
              height: getHeight(context, 0.06),
            ),
            SizedBox(
              width: getWidth(context, 0.01),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mainText(context: context, str: '$name - $posId'),
                subText(context: context, str: storeName),
              ],
            )
          ],
        )),
      ),
      drawer: Drawer(
          child: ListView(
        children: [DrawerHeader(child: Text('data'))],
      )),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       right: 0,
      //       height: getHeight(context, 0.12),
      //       child: Container(
      //         padding: EdgeInsets.symmetric(
      //           horizontal: getWidth(context, 0.01),
      //           vertical: getHeight(context, 0.01),
      //         ),
      //         color: subBackgroundColor,
      //         child: Row(
      //           children: [
      //             Image.asset(
      //               'assets/images/xiaomi_logo_nolabel.png',
      //             ),
      //             SizedBox(
      //               width: getWidth(context, 0.01),
      //             ),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 mainText(context: context, str: '$name - $posId'),
      //                 subText(context: context, str: storeName),
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
