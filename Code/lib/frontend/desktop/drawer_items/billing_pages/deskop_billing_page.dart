import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/pages/drawer_items/billing_pages/summary_page.dart';

import '../../../pages/drawer_items/billing_pages/billing_page.dart';

class Desktop_Billing_Page extends StatefulWidget {
  const Desktop_Billing_Page({Key? key}) : super(key: key);

  @override
  State<Desktop_Billing_Page> createState() => _Desktop_Billing_PageState();
}

class _Desktop_Billing_PageState extends State<Desktop_Billing_Page> {
  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serialNos = serialNoList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentCustomer.clear();
    serialNos = null;
  }

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
          IconButton(
            iconSize: getWidth(context, 0.018),
            splashRadius: getWidth(context, 0.015),
            onPressed: () {
              setState(() {
                check = false;
                currentCustomer.clear();
                serialNos!.clean();
              });
            },
            tooltip: 'Clear',
            icon: const Icon(
              color: Colors.black,
              Icons.clear_all_rounded,
            ),
          ),
          SizedBox(
            width: getWidth(context, 0.006),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (isAllAvailable()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Summary_Page();
                        },
                      ));
                    } else {
                      check = true;
                    }
                  });
                },
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
                ),
              ),
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
                          ? currentCustomer.firstName == ''
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
                        currentCustomer.firstName = value.trim();
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
                          ? currentCustomer.lastName == ''
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
                        currentCustomer.lastName = value.trim();
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
                          ? currentCustomer.emailId == ''
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
                        currentCustomer.emailId = value.trim();
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
                          ? currentCustomer.phoneNo == ''
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
                        currentCustomer.phoneNo = value.trim();
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
                        currentCustomer.address = value.trim();
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
                        currentCustomer.pinCode = value.trim();
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
                        currentCustomer.miId = value.trim();
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
                        color: Colors.white,
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
                                width: getWidth(context, 0.3),
                                child: Column(
                                  children: List.generate(
                                    selectedItems.values.toList()[i],
                                    (index) {
                                      return SizedBox(
                                        width: getWidth(context, 0.2),
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
                                            errorText: check
                                                ? serialNos!.serialNo[i]
                                                            [index] ==
                                                        ''
                                                    ? 'Fill this Field'
                                                    : null
                                                : null,
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
                                            setState(() {
                                              serialNos!.serialNo[i][index] =
                                                  value.trim();
                                            });
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
                                      'Total : ${(selectedItems.keys.toList()[i].price * selectedItems.values.toList()[i]).toString()} ₹',
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
            Divider(
              height: getHeight(context, 0.04),
              color: subBackgroundColor,
              thickness: 2,
              indent: getWidth(context, 0.015),
              endIndent: getWidth(context, 0.015),
            ),
          ],
        ),
      ),
    );
  }

  isAllAvailable() {
    bool temp = false;
    try {
      for (List<String> list in serialNos!.serialNo) {
        for (String str in list) {
          if (str == '') {
            temp = true;
            break;
          }
        }
      }
    } catch (e) {
      temp = true;
    }

    return (currentCustomer.firstName == '' ||
            currentCustomer.lastName == '' ||
            currentCustomer.phoneNo == '' ||
            currentCustomer.emailId == '' ||
            temp)
        ? false
        : true;
  }
}
