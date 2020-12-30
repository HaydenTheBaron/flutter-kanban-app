import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/globals.dart';

class SprintScreen extends StatelessWidget {
  const SprintScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Globals.sprintScreenBoard,
    );
  }
}