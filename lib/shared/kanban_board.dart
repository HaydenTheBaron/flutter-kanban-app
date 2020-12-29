import 'package:flutter/material.dart';

import 'package:kanbanapp2/shared/kanban_board_helpers/boardview_controller.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/board_list.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/board_item.dart';
import 'package:kanbanapp2/shared/kanban_board_helpers/boardview.dart';



class KanbanBoard extends StatelessWidget {
  const KanbanBoard({Key key}) : super(key: key);

  static List<BoardListObject> _listData = [
    BoardListObject(title: "To Do", items: <BoardItemObject>[
      BoardItemObject("board item object 4"),
    ]),
    BoardListObject(title: "In Progress", items: <BoardItemObject>[
      BoardItemObject("board item object 4"),
    ]),
    BoardListObject(title: "Waiting", items: <BoardItemObject>[
      BoardItemObject("board item object 5"),
    ]),
    BoardListObject(title: "Done", items: <BoardItemObject>[
      BoardItemObject("board item object 6"),
    ]),
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
      headerBackgroundColor: Color.fromRGBO(230, 230, 230, 1),
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
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
