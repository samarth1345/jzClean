import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jzclean/models/user_complaints.dart';
import 'package:jzclean/screens/user_folder/widgets/complaints_card.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class history extends StatefulWidget {
  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  bool loading = true;
  List<User_complaints> complaints = [];
  int count = 0;
  Future makearray(String args) async {
    final url;
    if (args == "active")
      url = Uri.parse(
          "http://austrian-expert.000webhostapp.com/active_comp_history.php");
    else
      url = Uri.parse(
          "http://austrian-expert.000webhostapp.com/resolved_comp_history.php");
    final prefs = await SharedPreferences.getInstance();
    final String? user_id = prefs.getString('user_id');
    var data = {
      "rollNo": user_id,
    };
    var res = await http.post(url, body: data);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      setState(() {
        for (Map i in data) {
          complaints.add(User_complaints.fromJson(i));
        }
        loading = false;
        count++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (count < 1) makearray(args.toString());
    return Scaffold(
      appBar: AppBar(title: Text('Complaints')),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : (complaints.length > 0
              ? (ListView.builder(
                  itemCount: complaints.length,
                  itemBuilder: ((context, index) {
                    final nDataList = complaints[index];
                    return complaints_card(
                      is_active: args.toString() == "active",
                      comp_id: nDataList.complaint_id,
                      type: nDataList.domain,
                      date: nDataList.date,
                      Room_no: nDataList.room_no,
                    );
                  }),
                ))
              : Center(
                  child: Text('OOPS there are no complaints'),
                )),
    );
  }
}
