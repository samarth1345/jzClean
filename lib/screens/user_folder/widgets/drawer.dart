import 'package:flutter/material.dart';
import 'dart:math' as math;

class drawer extends StatelessWidget {
  Widget buildtile(String title, IconData iconData, String navigation,
      BuildContext context, String argument) {
    return ListTile(
      leading: title != 'Logout'
          ? Icon(
              iconData,
              size: 30,
              color: Colors.blue,
            )
          : Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Icon(
                iconData,
                size: 30,
                color: Colors.blue,
              ),
            ),
      title: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.blue),
      ),
      onTap: () {
        Navigator.pop(context);
        title != 'Logout'
            ? Navigator.of(context).pushNamed(navigation, arguments: argument)
            : Navigator.of(context).pushReplacementNamed(navigation);
      },
      trailing: title != 'Logout'
          ? Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.blue,
            )
          : SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.supervised_user_circle,
              size: 150,
              color: Colors.blue,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  'Edit profile',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        buildtile('Active Complaints', Icons.indeterminate_check_box_outlined,
            "/history", context, "active"),
        SizedBox(
          height: 20,
        ),
        buildtile('Resolved Complaints', Icons.check_box, "/history", context,
            "resolved"),
        SizedBox(
          height: 20,
        ),
        buildtile('Settings', Icons.settings, "/settings", context, "none"),
        SizedBox(
          height: 20,
        ),
        buildtile('Logout', Icons.logout, "/loginpage", context, "none")
      ],
    );
  }
}
