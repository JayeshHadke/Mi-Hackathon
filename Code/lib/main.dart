import 'package:flutter/material.dart';
import 'package:mi_hackathon/frontend/pages/login_signup_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'BalooBhai2',
        dividerColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: LogIn_SignUp_Page(),
      ),
    );
  }
}
