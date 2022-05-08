import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  @override
  loginpageState createState() => loginpageState();
}

class loginpageState extends State<loginpage> {
  String dropdownValue = 'Select login type';
  TextEditingController idcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  Future verify_signin(BuildContext ctx) async {
    final url =
        Uri.parse("http://austrian-expert.000webhostapp.com/verifylogin.php");
    var data = {
      "id": idcontroller.text,
      "pass": passcontroller.text,
    };
    var res = await http.post(url, body: data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', idcontroller.text.toString());
    if (jsonDecode(res.body) == "true") {
      Navigator.of(ctx).pushNamed('/user');
    } else if (jsonDecode(res.body) == "false") {
      show_wrong_password();
    } else {
      show_account_not_found();
    }
  }

  void show_account_not_found() {
    Fluttertoast.showToast(
      msg: "Account not found",
      backgroundColor: Colors.grey,
      fontSize: 15,
      gravity: ToastGravity.CENTER,
    );
  }

  void show_wrong_password() {
    Fluttertoast.showToast(
      msg: "Wrong password",
      backgroundColor: Colors.grey,
      fontSize: 15,
      gravity: ToastGravity.CENTER,
    );
  }

  void verify_and_move(BuildContext ctx) async {
    int check;
    if (dropdownValue == 'Admin') {
      if (idcontroller.text == '11111' && passcontroller.text == 'password') {
        Navigator.of(ctx).pushNamed('/admin');
      } else if (idcontroller.text != '11111') {
        show_account_not_found();
      } else {
        show_wrong_password();
      }
    } else {
      await verify_signin(ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.account_circle,
                size: 200,
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: DropdownButton<String>(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        hint: Text(
                          dropdownValue,
                          style: TextStyle(
                              color: Color.fromARGB(255, 48, 46, 46),
                              fontSize: 20),
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 48, 46, 46),
                          size: 30.0,
                        ),
                        items: <String>['Admin', 'User'].map((String value) {
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
                      child: TextField(
                        controller: idcontroller,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 46, 46))),
                            border: OutlineInputBorder(),
                            labelText: 'Id',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 72, 72))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextField(
                        controller: passcontroller,
                        style:
                            TextStyle(color: Color.fromARGB(255, 48, 46, 46)),
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 48, 46, 46))),
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 72, 72))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () => verify_and_move(context),
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Color.fromARGB(255, 48, 46, 46),
                                    width: 2.0)),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                color: Color.fromARGB(255, 48, 46, 46),
                                fontSize: 20,
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
