import 'package:flutter/material.dart';
import 'package:kanbanapp2/shared/kanban_board.dart';

class BacklogBoard extends KanbanBoard {
  BacklogBoard({Key key})
      : super(<BoardListObject>[
          BoardListObject(title: "Next", items: <BoardItemObject>[
            BoardItemObject("bl object 1"),
          ]),
          BoardListObject(title: "Soon", items: <BoardItemObject>[
            BoardItemObject("bl object 2"),
          ]),
          BoardListObject(title: "Someday", items: <BoardItemObject>[
            BoardItemObject("bl object 3"),
          ]),
          BoardListObject(title: "TRASH", items: <BoardItemObject>[
          ]),
        ], key: key);
}
