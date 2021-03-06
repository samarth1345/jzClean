import 'package:flutter/material.dart';
import 'package:jzclean/screens/main/landingpage.dart';
import 'package:jzclean/screens/main/loginpage.dart';
import 'package:jzclean/screens/user_folder/history.dart';
import 'package:jzclean/screens/user_folder/profile_page.dart';
import 'package:jzclean/screens/user_folder/widgets/user_resolve.dart';
import 'package:jzclean/screens/user_folder/settings.dart';
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
        '/profile': (ctx) => profile(),
        //we are not sending any complaint id at the start
        'user_resolve': (ctx) => user_resolve(
              comp_id: "null",
            ),
      },
    );
  }
}
