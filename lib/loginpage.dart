import 'package:flutter/material.dart';
import 'package:jzclean/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String dropdownValue = 'Select login type';
  TextEditingController idcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  Future<bool> verify_signin() async {
    if (dropdownValue == 'admin')
      return idcontroller.text == '11111' && passcontroller.text == 'password';
    final url =
        Uri.parse("http://austrian-expert.000webhostapp.com/verifylogin.php");
    var data = {
      "id": idcontroller.text,
      "pass": passcontroller.text,
    };
    var res = await http.post(url, body: data);

    if (jsonDecode(res.body) == "true")
      return true;
    else if (jsonDecode(res.body) == "account not found") {
      var snackBar = SnackBar(content: Text('account not found'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return false;
  }

  void verify_and_move(BuildContext ctx) async {
    bool check = await verify_signin();
    if (check) {
      if (dropdownValue == 'Admin')
        Navigator.of(ctx).pushNamed('/admin');
      else
        Navigator.of(ctx).pushNamed('/user');
    } else {
      var snackBar = SnackBar(content: Text('Wrong id or password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                        obscureText: true,
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
