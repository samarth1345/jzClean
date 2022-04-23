import 'package:flutter/material.dart';

class complain_widget extends StatefulWidget {
  @override
  _complain_widgetState createState() => _complain_widgetState();
}

class _complain_widgetState extends State<complain_widget> {
  String dropdownValue = '--Please choose an option';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.white)),
              margin: EdgeInsets.all(10),
              child: DropdownButton<String>(
                style: const TextStyle(color: Colors.purple, fontSize: 20),
                hint: Text(
                  dropdownValue,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 30.0,
                ),
                items: <String>[
                  'Room Cleaning',
                  'AC Repair',
                  'Carpenter',
                  'Electricity'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
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
