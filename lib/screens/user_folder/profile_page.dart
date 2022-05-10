import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  String profileurl = "";
  String name = "";
  String DOB = "";
  String hostel = "";
  String room_no = "";
  String? user_id = "";
  bool loading = true;
  Widget buildtile(String data, IconData iconData, String title) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 35,
        color: Color.fromARGB(255, 19, 19, 19),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 19, 19, 19),
                fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: TextStyle(fontSize: 17, color: Colors.black87),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  void modifyurl() {
    profileurl.replaceAll('\\', '');
  }

  Future<void> getdata() async {
    final url = Uri.parse(
        "http://austrian-expert.000webhostapp.com/student_detail.php");
    final prefs = await SharedPreferences.getInstance();
    user_id = prefs.getString('user_id');
    var data = {"rollNo": user_id};
    var res = await http.post(url, body: data);

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      profileurl = data["profileLink"];
      modifyurl();
      print(profileurl);
      name = data["name"];
      DOB = data["dob"];
      hostel = data["roomType"];
      room_no = data["roomNo"];
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Color.fromARGB(255, 238, 136, 129)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Edit profile'),
          backgroundColor: Colors.transparent,
        ),
        body: loading == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: 200,
                            maxWidth: 200,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: Image.network(profileurl),
                          ),
                        ),
                        Container(
                            width: double.maxFinite,
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      'Account Info',
                                      style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildtile(name, Icons.verified_user, "Name"),
                                  buildtile(hostel, Icons.house_outlined,
                                      "Hostel type"),
                                  buildtile(room_no, Icons.room, "Room_no"),
                                  buildtile(DOB, Icons.date_range, "DOB"),
                                  buildtile(
                                    user_id as String,
                                    Icons.info_outlined,
                                    "User_id",
                                  )
                                ],
                              ),
                            ))
                      ],
                    )),
              ),
      ),
    );
  }
}
