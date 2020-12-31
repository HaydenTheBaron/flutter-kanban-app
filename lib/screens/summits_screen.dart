import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/globals.dart';

class SummitsScreen extends StatelessWidget {
  const SummitsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        title: Text('Summits'),
        backgroundColor: Colors.green,
      ),
      body: Globals.summitsScreenBoard,
    );
  }
}
