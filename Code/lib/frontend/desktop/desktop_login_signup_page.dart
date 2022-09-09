import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/authenticationMethods.dart';
import 'package:mi_hackathon/backend/globalELement.dart';

class Desktop_LogIn_SignUp_Page extends StatefulWidget {
  const Desktop_LogIn_SignUp_Page({Key? key}) : super(key: key);

  @override
  State<Desktop_LogIn_SignUp_Page> createState() =>
      _Desktop_LogIn_SignUp_PageState();
}

// use to differentiate login and signup page
const logInPage = true;
const signUpPage = false;

class _Desktop_LogIn_SignUp_PageState extends State<Desktop_LogIn_SignUp_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setWindow();
  }

  setWindow() async {
    await DesktopWindow.setMinWindowSize(const Size(900, 1000));
    await DesktopWindow.setFullScreen(true);
  }

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
        // Index with Title
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(
              left: getWidth(context, 0.1),
            ),
            width: double.maxFinite,
            height: getHeight(context, 0.15),
            decoration: BoxDecoration(
              color: subBackgroundColor,
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/xiaomi_logo_nolabel.png',
                  height: getHeight(context, 0.1),
                ),
                SizedBox(
                  width: getWidth(context, 0.01),
                ),
                headingText(context, 'Mi Store India', 0.05),
              ],
            ),
          ),
        ),
        // Back Button (Visible only when SignUp page is appears)
        Positioned(
          top: getHeight(context, 0.15),
          width: getWidth(context, 0.08),
          left: 0,
          height: getHeight(context, 0.07),
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
                      const Icon(Icons.arrow_back_ios_rounded,
                          color: Colors.black),
                      subText(context, 'Back', 0.03)
                    ],
                  ),
                )
              : SizedBox(),
        ),
        // Body ( Logo + InputField)
        Positioned(
          top: getHeight(context, 0.22),
          left: 0,
          right: 0,
          height: getHeight(context, 0.8),
          child: SizedBox(
            child: Wrap(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/images/xiaomi_logo.png',
                      height: getHeight(context, 0.3),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: getHeight(context, 0.01),
                        horizontal: getWidth(context, 0.01),
                      ),
                      width: getWidth(context, 0.2),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(
                          getWidth(context, 0.006),
                        ),
                      ),
                      child: user == logInPage
                          ?
                          // Login Widget
                          Column(
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
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    label: subText(context, 'Email Id', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      userId = value.trim();
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    errorText:
                                        wrongPassword ? 'Wrong Password' : null,
                                    label: subText(context, 'Password', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      password = value.trim();
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.08),
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
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return subBackgroundColor;
                                        }
                                        return mainBackgroundColor;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.04),
                                ),
                              ],
                            )
                          //SignUp Widget
                          : Column(
                              children: [
                                SizedBox(
                                  height: getHeight(context, 0.01),
                                ),
                                mainText(
                                  context: context,
                                  str: 'SignUp',
                                  size: 0.04,
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    label: subText(context, 'Email Id', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      userId = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    label: subText(context, 'Password', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    label: subText(context, 'Name', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    label: subText(context, 'Store Name', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      storeName = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.02),
                                ),
                                TextField(
                                  cursorColor: mainBackgroundColor,
                                  decoration: InputDecoration(
                                    label: subText(context, 'POS Id', 0.02),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: mainBackgroundColor),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    posId = value;
                                  },
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.08),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
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
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return subBackgroundColor;
                                        }
                                        return mainBackgroundColor;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getHeight(context, 0.04),
                                ),
                              ],
                            ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        // Footer
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: getHeight(context, 0.03),
          child: Container(
            color: subBackgroundColor,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subText(context, '      @All CopyRights Reserved', 0.015),
                subText(context, 'Xiaomi India      ', 0.015),
              ],
            ),
          ),
        )
      ],
    );
  }
}
