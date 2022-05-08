import 'package:flutter/material.dart';
import 'package:jzclean/screens/landingpage.dart';
import 'package:jzclean/screens/loginpage.dart';
import 'package:jzclean/screens/user_folder/history.dart';
import 'package:jzclean/screens/user_folder/user_resolve.dart';
import 'package:jzclean/settings.dart';
import 'screens/user_folder/user.dart';
import 'screens/admin_folder/admin.dart';
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
        '/user': (ctx) => user_page(),
        '/admin': (ctx) => admin(),
        '/loginpage': (ctx) => loginpage(),
        '/history': (ctx) => history(),
        '/settings': (ctx) => settings(),
        //we are not sending any complaint id at the start
        'user_resolve': (ctx) => user_resolve(
              comp_id: "null",
            ),
      },
    );
  }
}
