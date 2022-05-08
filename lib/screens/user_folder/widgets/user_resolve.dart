import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:reviews_slider/reviews_slider.dart';
import 'package:http/http.dart' as http;

class user_resolve extends StatefulWidget {
  //we are getting this to autofill complaint id if we get one!
  final String comp_id;
  const user_resolve({Key? key, required this.comp_id}) : super(key: key);

  @override
  State<user_resolve> createState() => _user_resolveState();
}

class _user_resolveState extends State<user_resolve> {
  int selectedValue1 = 1;
  TextEditingController compid = new TextEditingController();
  void onChange1(int value) {
    setState(() {
      selectedValue1 = value;
    });
  }

  void resetData() {
    setState(() {
      selectedValue1 = 1;
      compid..text = "";
    });
  }

  Future senddata() async {
    final url =
        Uri.parse("http://austrian-expert.000webhostapp.com/comp_resolve.php");
    var data = {
      "compID": compid.text,
      "feedback": selectedValue1.toString(),
    };
    var res = await http.post(url, body: data);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(jsonDecode(res.body).toString()),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    if (jsonDecode(res.body) == "complaint resolved") resetData();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.comp_id);
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: TextField(
                //if we have a complaint id before we will just fill it
                controller: compid
                  ..text = widget.comp_id != "null" ? widget.comp_id : "",
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.numbers,
                      color: Colors.blue,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelText: 'Complaint ID',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 99, 175, 238),
                      fontSize: 20,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'How was your experience',
              style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ReviewSlider(
              optionStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              onChange: onChange1,
            ),
            Text(
              selectedValue1.toString(),
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                width: double.maxFinite,
                height: 60.0,
                child: ElevatedButton(
                    onPressed: senddata,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
