import 'package:flutter/material.dart';
import 'package:jzclean/screens/admin_folder/widgets/Add_staff.dart';
import 'package:jzclean/screens/admin_folder/widgets/Mess.dart';
import 'package:jzclean/screens/admin_folder/widgets/homepage.dart';
import 'package:jzclean/screens/admin_folder/widgets/maintainence.dart';
import 'package:jzclean/screens/admin_folder/widgets/room_cleaning.dart';

class admin extends StatefulWidget {
  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
  PageController _myPage = PageController(initialPage: 0);
  List<bool> arr = [true, false, false, false, false];
  int prev_index = 0;
  void onTap(int idx) {
    setState(() {
      arr[prev_index] = false;
      arr[idx] = true;
      prev_index = idx;
      _myPage.jumpToPage(idx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin '),
        backgroundColor: Color(0xff6D28D9),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 5),
        decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff4338CA), Color(0xff6D28D9)]),
        ),
        child: BottomAppBar(
          elevation: 0,
          color: Colors.transparent,
          child: SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconBottomBar(
                      icon: Icons.home,
                      selected: arr[0],
                      onPressed: () => onTap(0)),
                  IconBottomBar(
                      icon: Icons.settings,
                      selected: arr[1],
                      onPressed: () => onTap(1)),
                  IconBottomBar(
                      icon: Icons.add_circle,
                      selected: arr[2],
                      onPressed: () => onTap(2)),
                  IconBottomBar(
                      icon: Icons.food_bank,
                      selected: arr[3],
                      onPressed: () => onTap(3)),
                  IconBottomBar(
                      icon: Icons.cleaning_services_outlined,
                      selected: arr[4],
                      onPressed: () => onTap(4))
                ],
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        controller: _myPage,
        children: <Widget>[
          homepage(),
          maintainence(),
          Add_staff(),
          Mess(),
          roomcleaning(),
        ],
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 35, color: selected ? accentColor : Colors.grey),
        ),
      ],
    );
  }
}
