import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    return InkWell(
      child: SizedBox(
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
      ),
      onTap: () {},
    );
  }
}

Widget makeListTile(String title, IconData icon, String data, String department,
    Color color1, Color color2) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2, color1]),
        borderRadius: BorderRadius.circular(10)),
    child: ListTile(
        tileColor: Colors.transparent,
        textColor: Colors.white,
        iconColor: Colors.white,
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.star_border,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              data,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              department,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        trailing: Icon(Icons.more_vert_rounded)),
  );
}

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Map<String, double> data = new Map();
  List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];
  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  void initState() {
    data.addAll(
        {'Mess': 20, 'Room cleaning': 10, 'Electricity': 30, 'Plumber': 5});
    super.initState();
  }

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
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            color: Colors.black54,
          ),
          SizedBox(
            height: 15,
          ),
          makeListTile('Best Rating', Icons.thumb_up_sharp, '4.5', 'Mess',
              Colors.green, Colors.green.shade300),
          SizedBox(
            height: 5,
          ),
          makeListTile(
              'Worst Rating',
              Icons.thumb_down_sharp,
              '2.5',
              'Room Cleaning',
              Color.fromARGB(255, 220, 39, 26),
              Colors.red.shade300),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 5,
            color: Colors.black54,
          ),
          SizedBox(
            height: 5,
          ),
          PieChart(
            dataMap: data, // if not declared, random colors will be chosen
            animationDuration: Duration(milliseconds: 1500),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery.of(context).size.width / 2.0,
            colorList: _colors, //determines the size of the chart
            chartType: ChartType.disc, //can be changed to ChartType.ring
            emptyColor: Colors.white60,
          )
        ]),
      ),
    );
  }
}
