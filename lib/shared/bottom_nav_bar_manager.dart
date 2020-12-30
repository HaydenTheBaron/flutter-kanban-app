import 'package:flutter/material.dart';
import 'package:kanbanapp2/screens/screens.dart';
import 'package:kanbanapp2/shared/globals.dart';


class BottomNavBarManager extends StatefulWidget {
  const BottomNavBarManager({Key key}) : super(key: key);

  @override
  _BottomNavBarManagerState createState() => _BottomNavBarManagerState();
}

class _BottomNavBarManagerState extends State<BottomNavBarManager> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Globals.reportsScreen, 
    Globals.whirlwindScreen,
    Globals.backlogScreen,
    Globals.summitsScreen,
    Globals.sprintScreen, 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(label: 'Reports', icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(label: 'Whirlwind', icon: Icon(Icons.wifi_protected_setup)),
            BottomNavigationBarItem(label: 'Backlog', icon: Icon(Icons.assignment_return)),
            BottomNavigationBarItem(label: 'Summits', icon: Icon(Icons.flag)),
            BottomNavigationBarItem(
                label: 'Sprint',
                icon: Icon(Icons.double_arrow_sharp),
                backgroundColor: Color.fromRGBO(230, 230, 230, 1)),
          ],
        ),
      ),
    );
  }
}
