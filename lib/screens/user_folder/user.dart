import 'package:flutter/material.dart';
import './user_complaints.dart';
import './user_resolve.dart';
import './drawer.dart';

class user_page extends StatefulWidget {
  @override
  State<user_page> createState() => _user_pageState();
}

class _user_pageState extends State<user_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(child: drawer()),
        appBar: AppBar(
            title: Text('User_Page'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.add_to_queue),
                text: 'Complaint',
              ),
              Tab(
                icon: Icon(Icons.remove_done),
                text: 'Resolve',
              )
            ])),
        body: TabBarView(children: <Widget>[user_complaints(), user_resolve()]),
      ),
    );
  }
}
