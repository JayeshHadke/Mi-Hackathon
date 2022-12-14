import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Mobile_Orders_Page extends StatefulWidget {
  const Mobile_Orders_Page({Key? key}) : super(key: key);

  @override
  State<Mobile_Orders_Page> createState() => _Mobile_Orders_PageState();
}

bool makeClear = false;

class _Mobile_Orders_PageState extends State<Mobile_Orders_Page> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: getWidth(context, 0.98),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            previousOrders.length,
            (index) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                        child: subText(
                          context: context,
                          size: 0.025,
                          str:
                              'Customer Name : ${previousOrders.reversed.toList()[index].customerDetails.firstName.toString()}',
                        ),
                      ),
                    ]),
                    Row(children: [
                      Expanded(
                        child: subText(
                          size: 0.025,
                          context: context,
                          str:
                              'Customer Email : ${previousOrders.reversed.toList()[index].customerDetails!.emailId.toString()}',
                        ),
                      ),
                    ]),
                    Row(children: [
                      Expanded(
                        child: subText(
                          size: 0.025,
                          context: context,
                          str:
                              'Customer Phone No. : ${previousOrders.reversed.toList()[index].customerDetails!.phoneNo.toString()}',
                        ),
                      ),
                    ]),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     subText(
                    //       size: 0.025,
                    //       context: context,
                    //       str: 'Items Brought : ',
                    //     ),
                    //     Column(
                    //       children: List.generate(
                    //           previousOrders[index].items.length, (i) {
                    //         return subText(
                    //             context: context,
                    //             size: 0.025,
                    //             str:
                    //                 '${i + 1}.  ${previousOrders.reversed.toList()[index].items.keys.toList()[i].name} (${previousOrders.reversed.toList()[index].items.keys.toList()[i].price.toString()}???) X ${previousOrders.reversed.toList()[index].items.values.toList()[i].toString()} ');
                    //       }),
                    //     ),
                    //     Column(
                    //       children: List.generate(
                    //         previousOrders[index].items.length,
                    //         (i) {
                    //           return subText(
                    //               context: context,
                    //               size: 0.025,
                    //               str:
                    //                   '  -   ${previousOrders.reversed.toList()[index].items.keys.toList()[i].price * previousOrders.reversed.toList()[index].items.values.toList()[i]}???');
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(children: [
                      Expanded(
                        child: subText(
                          size: 0.025,
                          context: context,
                          str:
                              'Payment Type : ${previousOrders.reversed.toList()[index].payment.name}',
                        ),
                      )
                    ]),
                    Row(children: [
                      Expanded(
                        child: subText(
                          size: 0.025,
                          context: context,
                          str:
                              'Payment Id : ${previousOrders.reversed.toList()[index].orderId.toString()}',
                        ),
                      )
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: subText(
                            context: context,
                            str:
                                'Total Amount Paid : ${previousOrders.reversed.toList()[index].price.toString()}??? ',
                            size: 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: subText(
                          size: 0.015,
                          context: context,
                          str:
                              'Date & Time : ${previousOrders.reversed.toList()[index].date.toString()} ${previousOrders.reversed.toList()[index].time.toString()}',
                        )),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
