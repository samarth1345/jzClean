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
  String dropdownValue = '----Select login type----';
  TextEditingController idcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  bool loading = true;
  bool showpassword = true;
  IconData icondata = Icons.remove_red_eye;
  void resetData() {
    setState(() {
      dropdownValue = '----Select login type----';
      idcontroller..text = "";
      passcontroller.text = "";
    });
  }

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
      resetData();
      Navigator.of(ctx).pushNamed('/user');
    } else if (jsonDecode(res.body) == "false") {
      show_wrong_password();
    } else {
      show_account_not_found();
    }
  }

  void show_account_not_found() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Account not found'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void show_wrong_password() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Wrong password'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
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
                size: 150,
                color: Colors.blue,
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(20),
                      alignment: AlignmentDirectional.center,
                      width: double.maxFinite,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                          hint: Text(
                            dropdownValue,
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
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
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: idcontroller,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: 'User id',
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        controller: passcontroller,
                        style:
                            TextStyle(color: Color.fromARGB(255, 48, 46, 46)),
                        obscureText: showpassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showpassword = !showpassword;
                                  if (showpassword == true)
                                    icondata = Icons.remove_red_eye;
                                  else
                                    icondata = Icons.visibility_off;
                                });
                              },
                              icon: Icon(
                                icondata,
                                color: Colors.blue,
                              ),
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
                            labelText: 'password',
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: SizedBox(
                        width: double.maxFinite,
                        height: 60.0,
                        child: ElevatedButton(
                            onPressed: () => verify_signin(context),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 20),
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
