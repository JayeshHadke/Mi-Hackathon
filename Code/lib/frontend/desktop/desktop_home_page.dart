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

enum drawerItems {
  Home,
  Orders,
  Account,
}

class _Desktop_Home_PageState extends State<Desktop_Home_Page> {
  String name = currentUser!.name;
  String email = currentUser!.email;
  String storeName = currentUser!.storeName;
  String posId = currentUser!.posId;
  drawerItems subPage = drawerItems.Home;

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainText(context: context, str: '$name - $posId'),
                  subText(context: context, str: storeName),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(
                top: getHeight(
                  context,
                  0.04,
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/xiaomi_logo.png'),
                ),
              ),
              child: Container(),
            ),
            Divider(
              height: getHeight(context, 0.08),
              color: subBackgroundColor,
              thickness: 2,
              indent: getWidth(context, 0.015),
              endIndent: getWidth(context, 0.015),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  subPage = drawerItems.Home;
                });
              },
              selectedTileColor: Colors.grey.shade200,
              selectedColor: mainBackgroundColor,
              selected: subPage == drawerItems.Home,
              leading: const Icon(Icons.home_rounded),
              title: mainText(context: context, str: 'Home'),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  subPage = drawerItems.Orders;
                });
              },
              selectedTileColor: Colors.grey.shade200,
              selectedColor: mainBackgroundColor,
              selected: subPage == drawerItems.Orders,
              leading: const Icon(Icons.shopping_cart_rounded),
              title: mainText(context: context, str: 'Orders'),
            ),
            ListTile(
              onTap: () {
                setState(() {
                  subPage = drawerItems.Account;
                });
              },
              selected: subPage == drawerItems.Account,
              selectedTileColor: Colors.grey.shade200,
              selectedColor: mainBackgroundColor,
              leading: const Icon(Icons.account_circle_rounded),
              title: mainText(context: context, str: 'Account'),
            ),
            ListTile(
              onTap: () {},
              selectedTileColor: Colors.grey.shade200,
              selectedColor: mainBackgroundColor,
              leading: const Icon(Icons.exit_to_app_rounded),
              title: mainText(context: context, str: 'Exit'),
            ),
          ],
        ),
      ),
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
