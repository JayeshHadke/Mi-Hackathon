import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Tablet_LogIn_SignUp_Page extends StatefulWidget {
  const Tablet_LogIn_SignUp_Page({Key? key}) : super(key: key);

  @override
  State<Tablet_LogIn_SignUp_Page> createState() =>
      _Tablet_LogIn_SignUp_PageState();
}

const logInPage = true;
const signUpPage = false;

class _Tablet_LogIn_SignUp_PageState extends State<Tablet_LogIn_SignUp_Page> {
  bool user = logInPage;
  String name = "";
  String userId = "";
  String password = "";
  String storeName = "";
  String posId = "";
  bool wrongPassword = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Title with icons
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          height: getHeight(context, 0.2),
          child: Container(
            color: subBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/xiaomi_logo.png',
                  height: getHeight(context, 0.15),
                ),
              ],
            ),
          ),
        ),
        // Back Button
        Positioned(
          top: getHeight(context, 0.2),
          width: getWidth(context, 0.16),
          left: 0,
          height: getHeight(context, 0.05),
          child: user == signUpPage
              ? TextButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    setState(() {
                      user = logInPage;
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: getWidth(context, 0.01),
                      ),
                      Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                        size: getWidth(context, 0.03),
                      ),
                      subText(context, 'Back', 0.03)
                    ],
                  ),
                )
              : SizedBox(),
        ),
        // Main Body
        Positioned(
          top: getHeight(context, 0.28),
          right: getWidth(context, 0.2),
          left: getWidth(context, 0.2),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: getHeight(context, 0.01),
              horizontal: getWidth(context, 0.09),
            ),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(
                getWidth(context, 0.006),
              ),
            ),
            height: getHeight(context, 0.68),
            width: getWidth(context, 0.3),
            child: user == logInPage
                ? Column(
                    children: [
                      SizedBox(
                        height: getHeight(context, 0.01),
                      ),
                      mainText(
                        context: context,
                        str: 'LogIn/SignUp',
                        size: 0.04,
                      ),
                      SizedBox(
                        height: getHeight(context, 0.03),
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: mainBackgroundColor,
                        decoration: InputDecoration(
                          label: subText(context, 'Email Id', 0.02),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainBackgroundColor),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            userId = value.trim();
                          });
                        },
                      ),
                      SizedBox(
                        height: getHeight(context, 0.05),
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: mainBackgroundColor,
                        decoration: InputDecoration(
                          errorText: wrongPassword ? 'Wrong Password' : null,
                          label: subText(context, 'Password', 0.02),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: mainBackgroundColor),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value.trim();
                          });
                        },
                      ),
                      SizedBox(
                        height: getHeight(context, 0.2),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              if (checkUser(userId)) {
                                if (checkPassword(userId, password)) {
                                  wrongPassword = false;
                                } else {
                                  wrongPassword = true;
                                }
                              } else {
                                user = signUpPage;
                              }
                            },
                          );
                        },
                        child: mainText(
                            context: context,
                            str: 'LogIn/SignUp',
                            size: 0.028,
                            color: Colors.white),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  getWidth(context, 0.01),
                                ),
                              );
                            },
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.pressed)) {
                                return subBackgroundColor;
                              }
                              return mainBackgroundColor;
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      mainText(
                        context: context,
                        str: 'SignUp',
                        size: 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          cursorColor: mainBackgroundColor,
                          decoration: InputDecoration(
                            label: subText(context, 'Email Id', 0.02),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainBackgroundColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              userId = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 0.01),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          cursorColor: mainBackgroundColor,
                          decoration: InputDecoration(
                            label: subText(context, 'Password', 0.02),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainBackgroundColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 0.01),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          cursorColor: mainBackgroundColor,
                          decoration: InputDecoration(
                            label: subText(context, 'Name', 0.02),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainBackgroundColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 0.01),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          cursorColor: mainBackgroundColor,
                          decoration: InputDecoration(
                            label: subText(context, 'Store Name', 0.02),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainBackgroundColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              storeName = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 0.01),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          cursorColor: mainBackgroundColor,
                          decoration: InputDecoration(
                            label: subText(context, 'POS Id', 0.02),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: mainBackgroundColor),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          onChanged: (value) {
                            posId = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context, 0.05),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          createUser(
                              userId: userId,
                              name: name,
                              password: password,
                              posId: posId,
                              storeName: storeName);
                        },
                        child: mainText(
                            context: context,
                            str: 'SignUp',
                            size: 0.028,
                            color: Colors.white),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith(
                            (states) {
                              return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  getWidth(context, 0.01),
                                ),
                              );
                            },
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.pressed)) {
                                return subBackgroundColor;
                              }
                              return mainBackgroundColor;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          height: getHeight(context, 0.022),
          child: Container(
            color: subBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subText(context, '      @All CopyRights Reserved', 0.015),
                subText(context, 'Xiaomi India      ', 0.015),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
