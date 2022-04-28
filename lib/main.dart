import 'package:flutter/material.dart';
import 'package:jzclean/landingpage.dart';
import 'package:jzclean/loginpage.dart';
import './user.dart';
import './admin.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: landingpage()),
      ),
      routes: {
        '/user': (ctx) => user(),
        '/admin': (ctx) => admin(),
        '/loginpage': (ctx) => loginpage(),
      },
    );
  }
}
