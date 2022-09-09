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
      name: 'Xiaomi',
      email: 'xiaomi@gmail.com',
      password: '123456',
      posId: '992288',
      storeName: 'Mi Digital')
};

checkUser(String userId) {
  return _users.containsKey(userId);
}

checkPassword(String userId, String password) {
  bool isValidUser = false;
  _users.forEach((key, value) {
    if (key == userId && value.password == password) {
      isValidUser = true;
    }
  });
  return isValidUser;
}

createUser(
    {required String userId,
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
}
