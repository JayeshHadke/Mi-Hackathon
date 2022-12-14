import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/pages/drawer_items/billing_pages/billing_page.dart';

class Mobile_Content_Page extends StatefulWidget {
  const Mobile_Content_Page({Key? key}) : super(key: key);

  @override
  State<Mobile_Content_Page> createState() => _Mobile_Content_PageState();
}

class _Mobile_Content_PageState extends State<Mobile_Content_Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getHeight(context, 0.01)),
        SizedBox(
          height: getHeight(context, 0.09),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: getWidth(context, 0.06),
                  ),
                  DropdownButton(
                    focusColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    value: itemsType.keys.toList()[selectedItemTypeIndex],
                    items: itemsType.keys.toList().map(
                      (String item) {
                        return DropdownMenuItem(
                          child:
                              subText(context: context, str: item, size: 0.03),
                          value: item,
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(
                        () {
                          selectedItemTypeIndex =
                              itemsType.keys.toList().indexOf(value.toString());
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedItemsCount = 0;
                        selectedItems.clear();
                      });
                    },
                    tooltip: 'Clear',
                    icon: const Icon(
                      Icons.clear_all_rounded,
                    ),
                  ),
                  Badge(
                    badgeColor: mainBackgroundColor,
                    badgeContent: Text(selectedItemsCount.toString()),
                    showBadge: selectedItemsCount == 0 ? false : true,
                    child: IconButton(
                      tooltip: selectedItemsCount == 0
                          ? 'Select Items to Continue'
                          : 'Next',
                      splashRadius: getWidth(context, 0.015),
                      onPressed: () {
                        if (selectedItemsCount == 0) {
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Billing_Page(),
                            ),
                          ).then(
                            (value) {
                              if (reRender) {
                                setState(() {});
                                reRender = false;
                              }
                            },
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context, 0.03),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: getHeight(context, 0.03)),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context, 0.025)),
            height: getHeight(context, 0.70),
            width: double.maxFinite,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: getWidth(context, 0.02),
                mainAxisSpacing: getHeight(context, 0.05),
              ),
              children: List.generate(
                itemsType.values.toList().length,
                (index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context, 0.01),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 0.3,
                      ),
                      // color: Colors.grey,
                      image: DecorationImage(
                        opacity: 0.9,
                        scale: 2.0,
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                            itemsType.values
                                .toList()[selectedItemTypeIndex]
                                .values
                                .toList()[index]
                                .url,
                            scale: 1.5),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mainText(
                            context: context,
                            size: 0.03,
                            str: itemsType.values
                                .toList()[selectedItemTypeIndex]
                                .values
                                .toList()[index]
                                .name),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mainText(
                                context: context,
                                size: 0.03,
                                str:
                                    '${accessoriesItems.values.toList()[index].price.toString()} ???'),
                            Container(
                              width: getWidth(context, 0.16),
                              height: getHeight(context, 0.04),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(
                                    getWidth(context, 0.005)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: getHeight(context, 0.03),
                                    width: getWidth(context, 0.035),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return subBackgroundColor;
                                            }
                                            return subBackgroundColor;
                                          },
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            if (selectedItems.containsKey(
                                                itemsType.values
                                                    .toList()[
                                                        selectedItemTypeIndex]
                                                    .values
                                                    .toList()[index])) {
                                              selectedItems.values.toList()[
                                                          selectedItems.keys
                                                              .toList()
                                                              .indexOf(itemsType
                                                                      .values
                                                                      .toList()[
                                                                          selectedItemTypeIndex]
                                                                      .values
                                                                      .toList()[
                                                                  index])] ==
                                                      1
                                                  ? selectedItems.remove(itemsType
                                                      .values
                                                      .toList()[
                                                          selectedItemTypeIndex]
                                                      .values
                                                      .toList()[index])
                                                  : selectedItems.update(
                                                      itemsType.values
                                                          .toList()[
                                                              selectedItemTypeIndex]
                                                          .values
                                                          .toList()[index],
                                                      (value) => value - 1,
                                                    );
                                              selectedItemsCount == 0
                                                  ? selectedItemsCount = 0
                                                  : selectedItemsCount--;
                                            }
                                          },
                                        );
                                      },
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          color: mainTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getWidth(context, 0.01),
                                  ),
                                  Text(
                                    getCount(index),
                                  ),
                                  SizedBox(
                                    width: getWidth(context, 0.01),
                                  ),
                                  SizedBox(
                                    height: getHeight(context, 0.03),
                                    width: getWidth(context, 0.035),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.zero),
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                          (states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return subBackgroundColor;
                                            }
                                            return subBackgroundColor;
                                          },
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(
                                          () {
                                            selectedItems.update(
                                              itemsType.values
                                                  .toList()[
                                                      selectedItemTypeIndex]
                                                  .values
                                                  .toList()[index],
                                              (value) => value + 1,
                                              ifAbsent: () => 1,
                                            );
                                            selectedItemsCount++;
                                          },
                                        );
                                      },
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          color: mainTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  getCount(int index) {
    try {
      return selectedItems.values
          .toList()[selectedItems.keys.toList().indexOf(itemsType.values
              .toList()[selectedItemTypeIndex]
              .values
              .toList()[index])]
          .toString();
    } catch (e) {
      return '0';
    }
  }
}
