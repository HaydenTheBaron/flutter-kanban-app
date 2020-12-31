import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/globals.dart';

class BacklogScreen extends StatelessWidget {
  const BacklogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        title: Text('Backlog'),
        backgroundColor: Colors.teal,
      ),
      body: Globals.backlogScreenBoard,
    );
  }
}
