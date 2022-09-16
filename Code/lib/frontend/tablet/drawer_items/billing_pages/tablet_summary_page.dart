import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Tablet_Summary_Page extends StatefulWidget {
  const Tablet_Summary_Page({Key? key}) : super(key: key);

  @override
  State<Tablet_Summary_Page> createState() => _Tablet_Summary_PageState();
}

class _Tablet_Summary_PageState extends State<Tablet_Summary_Page> {
  cart currentCart = cart(
      customerDetails: currentCustomer,
      payment: paymentTypes.Cash,
      time: '',
      date: '',
      serialNo: serialNos!,
      items: selectedItems,
      price: 0.0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentCart.price = calculateTotalAmount();
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
              height: getHeight(context, 0.01),
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.02),
                ),
                mainText(context: context, str: 'Summary', size: 0.05),
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
              children: [
                SizedBox(
                  width: getWidth(context, 0.2),
                ),
                mainText(
                    context: context,
                    str:
                        'Customer Full Name : ${currentCustomer.firstName} ${currentCustomer.lastName}',
                    size: 0.03),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.2),
                ),
                mainText(
                    context: context,
                    str: 'Customer Email : ${currentCustomer.emailId} ',
                    size: 0.03),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.2),
                ),
                mainText(
                    context: context,
                    str: 'Customer Phone No.  : ${currentCustomer.emailId} ',
                    size: 0.03),
              ],
            ),
            currentCustomer.address != ''
                ? Row(
                    children: [
                      SizedBox(
                        width: getWidth(context, 0.2),
                      ),
                      mainText(
                          context: context,
                          str: 'Address : ${currentCustomer.emailId} ',
                          size: 0.03),
                    ],
                  )
                : const SizedBox(),
            currentCustomer.pinCode != ''
                ? Row(
                    children: [
                      SizedBox(
                        width: getWidth(context, 0.2),
                      ),
                      mainText(
                          context: context,
                          str: 'PinCode : ${currentCustomer.emailId} ',
                          size: 0.03),
                    ],
                  )
                : const SizedBox(),
            currentCustomer.miId != ''
                ? Row(
                    children: [
                      SizedBox(
                        width: getWidth(context, 0.2),
                      ),
                      mainText(
                          context: context,
                          str: 'Mi Id : ${currentCustomer.emailId} ',
                          size: 0.03),
                    ],
                  )
                : const SizedBox(),
            Divider(
              height: getHeight(context, 0.05),
              color: subBackgroundColor,
              thickness: 2,
              indent: getWidth(context, 0.015),
              endIndent: getWidth(context, 0.015),
            ),
            Row(
              children: [
                SizedBox(
                  width: getWidth(context, 0.02),
                  height: getHeight(context, 0.09),
                ),
                mainText(context: context, str: 'Order Details', size: 0.04),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth(context, 0.02),
                  vertical: getHeight(context, 0.02)),
              height: getHeight(context, 0.78),
              width: double.maxFinite,
              child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 0.80),
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
                          vertical: getHeight(context, 0.01),
                          horizontal: getWidth(context, 0.01),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Image(
                                      image: NetworkImage(
                                          selectedItems.keys.toList()[i].url,
                                          scale: 1)),
                                  subText(
                                      context: context,
                                      str:
                                          '${selectedItems.keys.toList()[i].name}(${selectedItems.keys.toList()[i].price}₹) X ${selectedItems.values.toList()[i].toString()}',
                                      size: 0.025),
                                ],
                              ),
                              subText(
                                context: context,
                                str:
                                    'Total : ${selectedItems.values.toList()[i] * selectedItems.keys.toList()[i].price}₹ ',
                                size: 0.035,
                              ),
                            ]),
                      );
                    },
                  )),
            ),
            SizedBox(
              height: getHeight(context, 0.01),
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
                mainText(context: context, str: 'Payment Summary', size: 0.04),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: getWidth(context, 0.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: getWidth(context, 0.02),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              mainText(
                                  context: context,
                                  str: 'Total Amount',
                                  size: 0.03),
                              mainText(
                                context: context,
                                str: 'GST(18%)',
                                size: 0.03,
                              ),
                              SizedBox(
                                height: getHeight(context, 0.03),
                              ),
                              mainText(
                                context: context,
                                str: 'Amount Pay :',
                                size: 0.03,
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: getWidth(context, 0.02),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              mainText(
                                  context: context,
                                  str: '${currentCart.price}₹',
                                  size: 0.03),
                              mainText(
                                  context: context,
                                  str:
                                      '${double.parse((currentCart.price * 0.18).toStringAsFixed(2))}₹',
                                  size: 0.03),
                              SizedBox(
                                height: getHeight(context, 0.03),
                              ),
                              mainText(
                                  context: context,
                                  str:
                                      '${double.parse((currentCart.price * 1.18).toStringAsFixed(2))}₹',
                                  size: 0.03),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                mainText(context: context, str: 'Payment Type ', size: 0.03),
                SizedBox(
                  width: getWidth(context, 0.01),
                ),
                SizedBox(
                  width: getWidth(context, 0.08),
                  child: DropdownButton<paymentTypes>(
                    value: currentCart.payment,
                    items: paymentTypes.values
                        .map<DropdownMenuItem<paymentTypes>>(
                            (paymentTypes type) {
                      return DropdownMenuItem(
                        child: subText(
                            context: context, str: type.name, size: 0.03),
                        value: type,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        currentCart.payment = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.04),
                ),
                SizedBox(
                  height: getHeight(context, 0.06),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return mainBackgroundColor.withOpacity(0.8);
                        },
                      ),
                    ),
                    onPressed: () {
                      currentCart.date =
                          DateTime.now().toString().split(' ')[0];
                      currentCart.time =
                          DateTime.now().toString().split(' ')[1].split('.')[0];
                      addToPreviousCard(currentCart);
                      selectedItemsCount = 0;
                      selectedItems.clear();
                      currentCustomer.clear();
                      serialNos = serialNoList();
                      reRender = true;
                      SnackBar snackBar = SnackBar(
                        content: subText(
                            context: context,
                            str: 'Payment Done!',
                            color: Colors.white),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Future.delayed(const Duration(seconds: 3)).then((value) {
                        Navigator.of(context).pop();
                        Navigator.pop(context);
                        setState(() {});
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.payment_rounded,
                          color: Colors.black,
                        ),
                        subText(
                            context: context, str: 'Make Payment', size: 0.03),
                        SizedBox(
                          width: getWidth(context, 0.01),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: getWidth(context, 0.1),
                ),
              ],
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

  double calculateTotalAmount() {
    double price = 0;
    currentCart.items.forEach((key, value) {
      price += key.price * value;
    });
    return double.parse(price.toStringAsFixed(3));
  }
}
