import 'package:flutter/material.dart';
import 'package:mi_hackathon/backend/globalELement.dart';
import 'package:mi_hackathon/frontend/desktop/desktop_home_page.dart';
import 'package:mi_hackathon/frontend/mobile/mobile_home_page.dart';
import 'package:mi_hackathon/frontend/pages/home_page.dart';
import 'package:mi_hackathon/frontend/tablet/tablet_home_page.dart';

class _user {
  String name;
  String email;
  String password;
  String storeName;
  String posId;

  _user(
      {required this.name,
      required this.email,
      required this.password,
      required this.posId,
      required this.storeName});
}

var _users = <String, _user>{
  'xiaomi@gmail.com': _user(
      name: 'Mr.Xiaomi',
      email: 'xiaomi@gmail.com',
      password: '123456',
      posId: '992288',
      storeName: 'Mi Digital')
};

checkUser(String userId) {
  return _users.containsKey(userId);
}

checkPassword(BuildContext context, String userId, String password) {
  bool isValidUser = false;
  _users.forEach(
    (key, value) {
      if (key == userId && value.password == password) {
        isValidUser = true;
        currentUser = _user(
            name: value.name,
            email: value.email,
            password: value.password,
            posId: value.posId,
            storeName: value.storeName);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Home_Page();
            },
          ),
        );
      }
    },
  );
  return isValidUser;
}

createUser(
    {required BuildContext context,
    required String userId,
    required String name,
    required String password,
    required String posId,
    required String storeName}) {
  _users.addEntries(
    [
      MapEntry(
          userId,
          _user(
              name: name,
              email: userId,
              password: password,
              posId: posId,
              storeName: storeName))
    ],
  );
  currentUser = _user(
      name: name,
      email: userId,
      password: password,
      posId: posId,
      storeName: storeName);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return Home_Page();
      },
    ),
  );
}

_user? currentUser;

class CustomerDetail {
  String? firstName;
  String? secondName;
  int? phoneNo;
  String? address;
  int? pinCode;
  String? miId;
}
