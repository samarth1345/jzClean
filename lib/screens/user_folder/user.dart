import 'package:flutter/material.dart';
import 'widgets/user_complaints.dart';
import 'widgets/user_resolve.dart';
import 'widgets/drawer.dart';

class user_page extends StatefulWidget {
  @override
  State<user_page> createState() => _user_pageState();
}

class _user_pageState extends State<user_page> {
  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map;
    int index;
    //if request has come from active complaints page we would have a
    //complaint id with it else we would have send a null from any other page
    String comp_id = "null";
    if (args['index'] == "1") {
      index = 1;
      comp_id = args['comp_id'];
    } else
      index = 0;
    return DefaultTabController(
      initialIndex: index,
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
        body: TabBarView(children: <Widget>[
          user_complaints(),
          user_resolve(comp_id: comp_id)
        ]),
      ),
    );
  }
}
