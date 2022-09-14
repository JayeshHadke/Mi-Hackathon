import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Tablet_Billing_Page extends StatefulWidget {
  const Tablet_Billing_Page({Key? key}) : super(key: key);

  @override
  State<Tablet_Billing_Page> createState() => _Tablet_Billing_PageState();
}

String firstName = '',
    lastName = '',
    emailId = '',
    address = '',
    miId = '',
    pinCode = '',
    phoneNo = '';
bool check = false;

class _Tablet_Billing_PageState extends State<Tablet_Billing_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: getHeight(context, 0.1),
        backgroundColor: subBackgroundColor,
        elevation: 5,
        leading: IconButton(
          splashRadius: getWidth(context, 0.015),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back',
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      check = true;
                    });
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Colors.black26.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.payment_rounded,
                        color: Colors.black,
                      ),
                      subText(context: context, str: 'Payment', size: 0.03),
                      SizedBox(
                        width: getWidth(context, 0.01),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                    ],
                  )),
              SizedBox(
                width: getWidth(context, 0.02),
              )
            ],
          )
        ],
        title: Row(
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
                mainText(
                    context: context,
                    str: '${currentUser!.name} - ${currentUser!.posId}'),
                subText(context: context, str: currentUser!.storeName),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getHeight(context, 0.02),
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.02),
                ),
                mainText(context: context, str: 'Billing', size: 0.06),
              ],
            ),
            Divider(
              height: getHeight(context, 0.04),
              color: subBackgroundColor,
              thickness: 2,
              indent: getWidth(context, 0.015),
              endIndent: getWidth(context, 0.015),
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.02),
                  height: getHeight(context, 0.1),
                ),
                mainText(context: context, str: 'Customer Details', size: 0.04),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: getWidth(context, 0.2),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    smartQuotesType: SmartQuotesType.enabled,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      errorText: check
                          ? firstName == ''
                              ? 'Fill this Field'
                              : null
                          : null,
                      label: subText(
                          context: context, str: 'First Name *', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        check = false;
                        firstName = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.02),
                ),
                SizedBox(
                  width: getWidth(context, 0.2),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      errorText: check
                          ? lastName == ''
                              ? 'Fill this Field'
                              : null
                          : null,
                      label: subText(
                          context: context, str: 'Last Name *', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        check = false;
                        lastName = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.06),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: getWidth(context, 0.25),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      errorText: check
                          ? emailId == ''
                              ? 'Fill this Field'
                              : null
                          : null,
                      label: subText(
                          context: context, str: 'Email Id *', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        check = false;
                        emailId = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.02),
                ),
                SizedBox(
                  width: getWidth(context, 0.15),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      errorText: check
                          ? phoneNo == ''
                              ? 'Fill this Field'
                              : null
                          : null,
                      label: subText(
                          context: context, str: 'Phone No *', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        check = false;
                        phoneNo = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.06),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: getWidth(context, 0.3),
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      label: subText(
                          context: context, str: 'Full Address', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        address = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.02),
                ),
                SizedBox(
                  width: getWidth(context, 0.1),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      label: subText(
                          context: context, str: 'Pin Code', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        pinCode = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.06),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: getHeight(context, 0.02),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: getWidth(context, 0.1),
                  child: TextField(
                    keyboardType: TextInputType.streetAddress,
                    cursorColor: mainBackgroundColor,
                    decoration: InputDecoration(
                      label:
                          subText(context: context, str: 'Mi Id', size: 0.02),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: mainBackgroundColor),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        miId = value.trim();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.38),
                ),
              ],
            ),
            SizedBox(
              height: getHeight(context, 0.1),
            ),
            Divider(
              height: getHeight(context, 0.04),
              color: subBackgroundColor,
              thickness: 2,
              indent: getWidth(context, 0.015),
              endIndent: getWidth(context, 0.015),
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.02),
                  height: getHeight(context, 0.1),
                ),
                mainText(context: context, str: 'Items Details', size: 0.04),
              ],
            ),
            SizedBox(
              width: getWidth(context, 0.98),
              child: Column(
                children: List.generate(
                  selectedItems.length,
                  (i) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: getHeight(context, 0.02),
                        horizontal: getWidth(context, 0.01),
                      ),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 0.3,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: getHeight(context, 0.02),
                        horizontal: getWidth(context, 0.02),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: getWidth(context, 0.3),
                                  child: Image(
                                    image: NetworkImage(
                                      selectedItems.keys.toList()[i].url,
                                    ),
                                  ),
                                ),
                                mainText(
                                    context: context,
                                    str: selectedItems.keys.toList()[i].name),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              subText(
                                  context: context,
                                  str: 'Please Enter All Items Serial Number',
                                  size: 0.03),
                              SizedBox(
                                height: getHeight(context, 0.02),
                              ),
                              SizedBox(
                                width: getWidth(context, 0.4),
                                child: Column(
                                  children: List.generate(
                                    selectedItems.values.toList()[i],
                                    (index) {
                                      return SizedBox(
                                        width: getWidth(context, 0.3),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: mainBackgroundColor,
                                          decoration: InputDecoration(
                                            label: subText(
                                                context: context,
                                                str:
                                                    'Item ${index + 1} Serial No. ',
                                                size: 0.025),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: mainBackgroundColor),
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              subText(
                                  context: context,
                                  str: 'Price Summary',
                                  size: 0.03),
                              SizedBox(
                                height: getHeight(context, 0.02),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    selectedItems.values.toList()[i],
                                    (index) {
                                      return subText(
                                          context: context,
                                          str:
                                              '${selectedItems.keys.toList()[i].price.toString()} ₹',
                                          size: 0.03,
                                          fontWeight: FontWeight.w400);
                                    },
                                  ),
                                ),
                              ),
                              subText(
                                  context: context,
                                  str:
                                      'Total :${(selectedItems.keys.toList()[i].price * selectedItems.values.toList()[i]).toString()} ₹',
                                  size: 0.03),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: getHeight(context, 0.1),
            ),
          ],
        ),
      ),
    );
  }
}
