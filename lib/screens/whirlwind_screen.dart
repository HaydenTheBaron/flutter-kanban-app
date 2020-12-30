import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/globals.dart';

class WhirlwindScreen extends StatelessWidget {
  const WhirlwindScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Globals.whirlwindScreenBoard,
    );
  }
}
