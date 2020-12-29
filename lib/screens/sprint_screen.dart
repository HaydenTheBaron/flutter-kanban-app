import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/kanban_board.dart';

class SprintScreen extends StatefulWidget {
  const SprintScreen({Key key}) : super(key: key);

  @override
  _SprintScreenState createState() => _SprintScreenState();
}

class _SprintScreenState extends State<SprintScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Reports'), // Reports Screen
    Text('Index 1: Whirlwind'), // Whirlwind Screen
    Text('Index 2: Backlog'), // Backlog Screen
    Text('Index 2: Summits'), // Summits Screen
    KanbanBoard(), // Sprint Screen // TODO: refactor navigation bar logic outside of sprint_screen
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
        appBar:
            AppBar(title: const Text('Sprint'), backgroundColor: Colors.grey),
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
