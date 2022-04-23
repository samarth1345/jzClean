import 'package:flutter/material.dart';
import './complaint_widget.dart';
import './resolve_widget.dart';

class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  String dropdownValue = '--Please choose an option--';
  int current_tab = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blue])),
      child: Scaffold(
          appBar: AppBar(
            title: Text('User page'),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                          child: Text('Complaints',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ))),
                    ),
                    InkWell(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: Colors.white, width: 1.5)),
                          child: Text('Resolve',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ))),
                    ),
                  ]),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.white)),
                    margin: EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      style:
                          const TextStyle(color: Colors.purple, fontSize: 20),
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
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 20)),
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
          )),
    );
  }
}
