import 'package:flutter/material.dart';

class makecard extends StatelessWidget {
  String text;
  String data;
  IconData icon;
  Color color1;
  Color color2;
  makecard(
      {Key? key,
      required this.text,
      required this.data,
      required this.icon,
      required this.color1,
      required this.color2});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [color1, color2])),
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: 35,
                    color: Colors.white,
                  ),
                  Text(
                    data,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )
                ],
              ),
              Text(
                text,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Column(
            children: [
              Container(
                width: double.maxFinite,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      makecard(
                          text: 'Active ',
                          data: '100',
                          icon: Icons.indeterminate_check_box,
                          color1: Colors.amberAccent,
                          color2: Colors.amber),
                      makecard(
                          text: 'Resolved',
                          data: '100',
                          icon: Icons.check_box,
                          color1: Colors.purpleAccent,
                          color2: Colors.purple),
                    ]),
              ),
              Container(
                width: double.maxFinite,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      makecard(
                          text: 'Spending ',
                          data: '10000',
                          icon: Icons.currency_rupee,
                          color1: Colors.blueAccent,
                          color2: Colors.blue),
                      makecard(
                          text: 'Active ',
                          data: '100',
                          icon: Icons.check_box,
                          color1: Colors.greenAccent,
                          color2: Colors.green),
                    ]),
              )
            ],
          )
        ]),
      ),
    );
  }
}
