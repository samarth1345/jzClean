import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class user_complaints extends StatefulWidget {
  @override
  State<user_complaints> createState() => _user_complaintsState();
}

class _user_complaintsState extends State<user_complaints> {
  String dropdownValue = '--Please choose an option--';
  TextEditingController roomnumber = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  Future sendData() async {
    final url =
        Uri.parse("http://austrian-expert.000webhostapp.com/insComplaint.php");
    var data = {
      "domain": dropdownValue,
      "roomInfo": roomnumber.text,
      "time": dateinput.text + " " + timeinput.text,
      "desc": description.text
    };
    var res = await http.post(url, body: data);
    if (jsonDecode(res.body) != "false") {
      Fluttertoast.showToast(
        msg: "Your complaint id is " + jsonDecode(res.body),
        backgroundColor: Colors.grey,
        fontSize: 20,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(20),
                width: double.maxFinite,
                alignment: AlignmentDirectional.center,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    style: const TextStyle(color: Colors.blue, fontSize: 20),
                    hint: Text(
                      dropdownValue,
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                    items: <String>[
                      'Mess',
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
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                child: TextField(
                  controller: roomnumber,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.room_sharp,
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
                      labelText: 'Room Number',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 99, 175, 238),
                        fontSize: 20,
                      )),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: TextField(
                    controller:
                        dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                      ), //icon of text field
                      labelText: "Enter Date",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 99, 175, 238),
                        fontSize: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ), //label text of field
                    ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: TextField(
                    controller:
                        timeinput, //editing controller of this TextField
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.timer,
                        color: Colors.blue,
                      ), //icon of text field
                      labelText: "Enter Time",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 99, 175, 238),
                        fontSize: 20,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ), //label text of field
                    ),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );

                      if (pickedTime != null) {
                        print(pickedTime);

                        print(pickedTime.format(context) +
                            ":00"); //output 10:51 PM
                        //DateFormat() is from intl package, you can format the time on any pattern you need.

                        setState(() {
                          timeinput.text = pickedTime.format(context) +
                              ":00"; //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    },
                  )),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 300.0,
                  ),
                  child: TextField(
                    controller: description,
                    maxLines: null,
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
                        labelText: 'describe your problem',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 99, 175, 238),
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 60.0,
                  child: ElevatedButton(
                      onPressed: sendData,
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              )
            ],
          )),
    );
  }
}
