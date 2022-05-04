import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  Widget buildtile(String title, IconData iconData) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.blue),
      ),
      onTap: () {},
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
              size: 200,
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
        buildtile('Active Complaints', Icons.indeterminate_check_box_outlined),
        SizedBox(
          height: 20,
        ),
        buildtile('Resolved Complaints', Icons.check_box),
        SizedBox(
          height: 20,
        ),
        buildtile('Settings', Icons.settings)
      ],
    );
  }
}
