import 'package:flutter/material.dart';
import 'package:kanbanapp2/boardview_controller.dart';
import 'package:kanbanapp2/board_list.dart';
import 'package:kanbanapp2/board_item.dart';
import 'package:kanbanapp2/boardview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: HomePage(),
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static List<BoardListObject> _listData = [
    BoardListObject(title: "To Do"),
    BoardListObject(title: "In Progress"),
    BoardListObject(title: "Waiting"),
    BoardListObject(title: "Done"),
  ];

  static BoardViewController boardViewController = BoardViewController();

  @override
  Widget build(BuildContext context) {
    List<BoardList> _lists = [];
    for (var listDatum in _listData) {
      _lists.add(_createBoardList(listDatum));
    }

    return BoardView(
      lists: _lists,
      boardViewController: boardViewController,
    );
  }

  Widget _createBoardList(BoardListObject list) {
    List<BoardItem> items = [];
    for (var item in list.items) {
      items.add(buildBoardItem(item));
    }

    return BoardList(
      onStartDragList: (int listIndex) {},
      onTapList: (int listIndex) async {},
      onDropList: (int listIndex, int oldListIndex) {
        var list = _listData[oldListIndex];
        _listData.removeAt(oldListIndex);
        _listData.insert(listIndex, list);
      },
      headerBackgroundColor: Colors.lightBlue,
      backgroundColor: Colors.lightBlue,
      header: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              list.title,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
      items: items,
    );
  }

  Widget buildBoardItem(BoardItemObject itemObject) {
    return BoardItem(
      onStartDragItem: (int listIndex, int itemIndex, BoardItemState state) {},
      onDropItem: (int listIndex, int itemIndex, int oldListIndex,
          int oldItemIndex, BoardItemState state) {
        var item = _listData[oldListIndex].items[oldItemIndex];
        _listData[oldListIndex].items.removeAt(oldItemIndex);
        _listData[listIndex].items.insert(itemIndex, item);
      },
      onTapItem: (int listIndex, int itemIndex, BoardItemState state) async {},
      item: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(itemObject.title),
        ),
      ),
    );
  }
}

class BoardListObject {
  String title;
  List<BoardItemObject> items;

  BoardListObject({this.title, this.items}) {
    if (this.title == null) {
      this.title = "";
    }
    if (this.items == null) {
      this.items = [];
    }
  }
}

class BoardItemObject {
  String title;

  BoardItemObject(this.title) {
    if (this.title == null) {
      this.title = "";
    }
  }
}
