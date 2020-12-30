import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/globals.dart';

class SummitsScreen extends StatelessWidget {
  const SummitsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Globals.summitsScreenBoard,
    );
  }
}