import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        title: Text('Reports'),
        backgroundColor: Colors.orange,
      ),
      body: Placeholder(color: Colors.orange,)
    );
  }
}
