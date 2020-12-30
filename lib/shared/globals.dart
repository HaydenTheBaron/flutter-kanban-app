import 'package:kanbanapp2/shared/sprint_board.dart';
import 'package:kanbanapp2/shared/whirlwind_board.dart';
import 'package:kanbanapp2/screens/screens.dart';


class Globals {
  // Boards
  static var sprintScreenBoard = SprintBoard();
  static var whirlwindScreenBoard = WhirlwindBoard();
  // TODO: add summit board

  // Screens
  static const reportsScreen = ReportsScreen();
  static const whirlwindScreen = WhirlwindScreen();
  static const backlogScreen = BacklogScreen();
  static const summitsScreen = SummitsScreen();
  static const sprintScreen = SprintScreen();
}

