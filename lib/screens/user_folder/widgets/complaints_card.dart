import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle _textStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 22.0,
    );
  }

  static TextStyle _textStyle1() {
    return TextStyle(
      color: Colors.black45,
      fontSize: 20.0,
    );
  }

  static TextStyle _textStyle2() {
    return TextStyle(
      color: Colors.red,
      fontSize: 20.0,
    );
  }
}

class complaints_card extends StatelessWidget {
  bool is_active;
  String comp_id;
  String type;
  String date;
  String Room_no;
  complaints_card(
      {required this.is_active,
      required this.comp_id,
      required this.type,
      required this.date,
      required this.Room_no});
  String getdate(String date) {
    int idx = date.indexOf(" ");
    return date.substring(0, idx);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          child: Column(children: <Widget>[
            Row(
              children: [
                Container(
                  child: Text(
                    comp_id,
                    style: CustomTextStyle._textStyle(),
                  ),
                ),
                Spacer(),
                //this button will only be active if active compplaints are to be displayed
                is_active
                    ? Container(
                        child: InkWell(
                          child: Text(
                            'Resolve',
                            style: CustomTextStyle._textStyle2(),
                          ),
                          onTap: () {},
                        ),
                      )
                    : SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Text(
                      type,
                      style: CustomTextStyle._textStyle1(),
                    ),
                  ),
                  VerticalDivider(),
                  Container(
                    child: Text(
                      getdate(date),
                      style: CustomTextStyle._textStyle1(),
                    ),
                  ),
                  VerticalDivider(),
                  Container(
                    child: Text(
                      Room_no,
                      style: CustomTextStyle._textStyle1(),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
