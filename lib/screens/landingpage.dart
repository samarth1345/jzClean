import 'package:flutter/material.dart';

class landingpage extends StatelessWidget {
  void move_to_loginpage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/loginpage',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
                fontSize: 40.0, color: Colors.white, fontFamily: 'Pacifico'),
            children: <TextSpan>[
              new TextSpan(text: 'Ready to leave your '),
              new TextSpan(
                  text: 'worries ',
                  style: new TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold)),
              new TextSpan(text: 'to us '),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
                fontSize: 30.0, color: Colors.white, fontFamily: 'Pacifico'),
            children: <TextSpan>[
              new TextSpan(text: 'We let you manage your '),
              new TextSpan(
                  text: 'Housekeep ',
                  style: new TextStyle(
                      color: Colors.yellow, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => move_to_loginpage(context),
              child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.white, width: 2.0)),
                  child: Text('Let\'s go',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontFamily: 'Pacifico'))),
            ),
          ],
        ),
      ],
    );
  }
}
