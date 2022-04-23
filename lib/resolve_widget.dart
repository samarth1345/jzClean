import 'package:flutter/material.dart';

class resolve_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(),
                    labelText: 'Complaint Id',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(),
                    labelText: 'Staff Id',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
        InkWell(
          child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.white)),
              child: Text('Submit',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ))),
        ),
      ],
    );
  }
}
