import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/pages/drawer_items/billing_pages/billing_page.dart';

class Desktop_Content_Page extends StatefulWidget {
  const Desktop_Content_Page({Key? key}) : super(key: key);

  @override
  State<Desktop_Content_Page> createState() => _Desktop_Content_PageState();
}

class _Desktop_Content_PageState extends State<Desktop_Content_Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    badgeContent: subText(
                      context: context,
                      str: selectedItemsCount.toString(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Billing_Page(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_rounded,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getWidth(context, 0.02),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: getHeight(context, 0.01),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context, 0.02)),
          height: getHeight(context, 0.78),
          width: double.maxFinite,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: getWidth(context, 0.015),
              mainAxisSpacing: getHeight(context, 0.03),
            ),
            children: List.generate(
              itemsType.values.toList()[selectedItemTypeIndex].length,
              (index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: getWidth(context, 0.01)),
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 0.3,
                    ),
                    image: DecorationImage(
                      opacity: 0.9,
                      scale: 1.5,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          itemsType.values
                              .toList()[selectedItemTypeIndex]
                              .values
                              .toList()[index]
                              .url,
                          scale: 2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mainText(
                          context: context,
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
                              str: accessoriesItems.values
                                  .toList()[index]
                                  .price
                                  .toString()),
                          SizedBox(
                            width: getWidth(context, 0.06),
                            height: getHeight(context, 0.06),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: getHeight(context, 0.04),
                                  width: getWidth(context, 0.014),
                                  child: TextButton(
                                    style: ButtonStyle(
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
                                    child: Center(
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          color: mainTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  getCount(index),
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.04),
                                  width: getWidth(context, 0.014),
                                  child: TextButton(
                                    style: ButtonStyle(
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
                                                .toList()[selectedItemTypeIndex]
                                                .values
                                                .toList()[index],
                                            (value) => value + 1,
                                            ifAbsent: () => 1,
                                          );
                                          selectedItemsCount++;
                                        },
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        '+',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: mainTextColor,
                                        ),
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
